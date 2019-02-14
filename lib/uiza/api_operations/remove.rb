module Uiza
  module APIOperations
    module Remove
      def remove id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{self::OBJECT_API_PATH}"
        method = :delete
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}

        uiza_client = UizaClient.new url, method, headers, params
        uiza_client.execute_request
      end
    end
  end
end
