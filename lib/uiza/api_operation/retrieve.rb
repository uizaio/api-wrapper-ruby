module Uiza
  module APIOperation
    module Retrieve
      def retrieve id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{self::OBJECT_API_PATH}"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}

        uiza_client = UizaClient.new url, method, headers, params, self::OBJECT_API_DESCRIPTION_LINK[:retrieve]
        uiza_client.execute_request
      end
    end
  end
end
