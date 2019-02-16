module Uiza
  module APIOperation
    module Create
      def create params
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{self::OBJECT_API_PATH}"
        method = :post
        headers = {"Authorization" => Uiza.authorization}

        uiza_client = UizaClient.new url, method, headers, params, self::OBJECT_API_DESCRIPTION_LINK[:create]
        response = uiza_client.execute_request

        self.retrieve response.id
      end
    end
  end
end
