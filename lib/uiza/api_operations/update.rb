module Uiza
  module APIOperations
    module Update
      def update params
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{self::OBJECT_API_PATH}"
        method = :put
        headers = {"Authorization" => Uiza.authorization}

        uiza_client = UizaClient.new url, method, headers, params
        uiza_client.execute_request
      end
    end
  end
end
