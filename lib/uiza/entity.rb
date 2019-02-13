module Uiza
  class Entity
    extend Uiza::APIOperations::Create
    extend Uiza::APIOperations::Retrieve
    extend Uiza::APIOperations::List
    extend Uiza::APIOperations::Update
    extend Uiza::APIOperations::Delete

    OBJECT_API_PATH = "media/entity".freeze

    class << self
      def search keyword
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/search"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {keyword: keyword}

        uiza_client = UizaClient.new url, method, headers, params
        uiza_client.execute_request
      end

      def publish id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/publish"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}

        uiza_client = UizaClient.new url, method, headers, params
        uiza_client.execute_request
      end

      def get_status_publish id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/publish/status"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}

        uiza_client = UizaClient.new url, method, headers, params
        uiza_client.execute_request
      end
    end
  end
end
