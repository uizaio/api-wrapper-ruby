module Uiza
  module APIOperation
    module Update
      def update params
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{self::OBJECT_API_PATH}"
        method = :put
        headers = {"Authorization" => Uiza.authorization}
        params["appId"] = Uiza.app_id

        uiza_client = UizaClient.new url, method, headers, params, self::OBJECT_API_DESCRIPTION_LINK[:update]
        response = uiza_client.execute_request

        retrieve response.id
      end
    end
  end
end
