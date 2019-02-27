module Uiza
  class Analytic
    OBJECT_API_PATH = "analytic/entity/video-quality".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      get_total_line: "https://docs.uiza.io/#total-line"
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
    end
  end
end
