module Uiza
  class UizaClient
    def initialize url, method, headers, params
      @uri = URI url

      case method
      when :get
        @uri.query = URI.encode_www_form params
        @request = Net::HTTP::Get.new @uri
      when :post
        @request = Net::HTTP::Post.new @uri
        @request.set_form_data params
      end

      headers.each do |key, value|
        @request[key] = value
      end

      @http = Net::HTTP.start @uri.host, @uri.port, use_ssl: true
    end

    def execute_request
      @response = @http.request @request
      @response.body
    end
  end
end
