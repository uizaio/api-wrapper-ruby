module Uiza
  module APIOperation
    module Add
      def add params
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{self::OBJECT_API_PATH}"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params["appId"] = Uiza.app_id

        uiza_client = UizaClient.new url, method, headers, params, self::OBJECT_API_DESCRIPTION_LINK[:add]
        response = uiza_client.execute_request

        retrieve response.id
      end
    end
  end
end
