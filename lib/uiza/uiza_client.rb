module Uiza
  class UizaClient
    def initialize url, method, headers, params, description_link
      @uri = URI.parse url
      @description_link = description_link

      params ||= {}

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
      message = @response["message"]
      check_and_raise_error code, message

      data = @response["data"]
      response = JSON.parse(data.to_json, object_class: Uiza::UizaOpenStruct)

      return response unless response

      if response.is_a?(Array)
        response.each(&:define_methods)
      else
        response.define_methods
      end

      response
    end

    private

    def check_and_raise_error code, message
      reg_2xx = /^2\d\d$/
      reg_4xx = /^4\d\d$/
      reg_5xx = /^5\d\d$/

      return if code.to_s =~ reg_2xx

      error = case code.to_s
              when "400"
                Uiza::Error::BadRequestError.new @description_link, message
              when "401"
                Uiza::Error::UnauthorizedError.new @description_link, message
              when "404"
                Uiza::Error::NotFoundError.new @description_link, message
              when "422"
                Uiza::Error::UnprocessableError.new @description_link, message
              when "500"
                Uiza::Error::InternalServerError.new @description_link, message
              when "503"
                Uiza::Error::ServiceUnavailableError.new @description_link, message
              when reg_4xx
                Uiza::Error::ClientError.new @description_link, message, code
              when reg_5xx
                Uiza::Error::ServerError.new @description_link, message, code
              else
                Uiza::Error::UizaError.new @description_link, message, code
              end

      raise error, message
    end
  end
end
