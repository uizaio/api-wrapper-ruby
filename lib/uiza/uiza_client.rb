module Uiza
  class UizaClient
    def initialize url, method, headers, params, description_link
      @uri = URI.parse url
      @description_link = description_link

      case method.to_s.downcase
      when "get"
        @uri.query = URI.encode_www_form params
        @request = Net::HTTP::Get.new @uri
      when "post"
        @request = Net::HTTP::Post.new @uri
        @request.body = JSON.dump params
      when "put"
        @request = Net::HTTP::Put.new @uri
        @request.body = JSON.dump params
      when "delete"
        @request = Net::HTTP::Delete.new @uri
        @request.body = JSON.dump params
      end

      @request.content_type = "application/json"
      headers.each do |key, value|
        @request[key] = value
      end
    end

    def execute_request
      @http = Net::HTTP.start @uri.host, @uri.port, use_ssl: true
      @response = @http.request @request
      @response = JSON.parse @response.body

      code = @response["code"]
      check_and_raise_error code

      data = @response["data"]
      JSON.parse(data.to_json, object_class: OpenStruct)
    end

    private

    def check_and_raise_error code
      reg_2xx = /^2\d\d$/
      reg_4xx = /^4\d\d$/
      reg_5xx = /^5\d\d$/

      return if code.to_s =~ reg_2xx

      case code.to_s
      when "400"
        error = Uiza::Error::BadRequestError.new @description_link
        message = Uiza::Error::BadRequestError::DEFAULT_MESSAGE
      when "401"
        error = Uiza::Error::UnauthorizedError.new @description_link
        message = Uiza::Error::UnauthorizedError::DEFAULT_MESSAGE
      when "404"
        error = Uiza::Error::NotFoundError.new @description_link
        message = Uiza::Error::NotFoundError::DEFAULT_MESSAGE
      when "422"
        error = Uiza::Error::UnprocessableError.new @description_link
        message = Uiza::Error::UnprocessableError::DEFAULT_MESSAGE
      when "500"
        error = Uiza::Error::InternalServerError.new @description_link
        message = Uiza::Error::InternalServerError::DEFAULT_MESSAGE
      when "503"
        error = Uiza::Error::ServiceUnavailableError.new @description_link
        message = Uiza::Error::ServiceUnavailableError::DEFAULT_MESSAGE
      when reg_4xx
        error = Uiza::Error::ClientError.new @description_link, code
        message = Uiza::Error::ClientError::DEFAULT_MESSAGE
      when reg_5xx
        error = Uiza::Error::ServerError.new @description_link, code
        message = Uiza::Error::ServerError::DEFAULT_MESSAGE
      else
        error = Uiza::Error::UizaError.new @description_link, code
        message = Uiza::Error::UizaError::DEFAULT_MESSAGE
      end

      raise error, message
    end
  end
end
