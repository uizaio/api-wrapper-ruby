module Uiza
  class Analytic
    OBJECT_API_PATH = "analytic/entity/video-quality".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      get_total_line: "https://docs.uiza.io/#total-line",
      get_type: "https://docs.uiza.io/#type",
      get_line: "https://docs.uiza.io/#line"
    }.freeze

    class << self
      def get_total_line params
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/total-line-v2"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_total_line]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def get_type params
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/type"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_type]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def get_line params
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/line"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_line]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end
    end
  end
end
