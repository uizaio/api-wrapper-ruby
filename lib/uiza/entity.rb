module Uiza
  class Entity
    extend Uiza::APIOperations::Create
    extend Uiza::APIOperations::Retrieve
    extend Uiza::APIOperations::List
    extend Uiza::APIOperations::Update
    extend Uiza::APIOperations::Delete

    OBJECT_API_PATH = "media/entity".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-entity",
      retrieve: "https://docs.uiza.io/#retrieve-an-entity",
      list: "https://docs.uiza.io/#list-all-entities",
      update: "https://docs.uiza.io/#update-an-entity",
      delete: "https://docs.uiza.io/#delete-an-entity",
      search: "https://docs.uiza.io/#search-entity",
      publish: "https://docs.uiza.io/#publish-entity-to-cdn",
      get_status_publish: "https://docs.uiza.io/#get-status-publish",
      get_aws_upload_key: "https://docs.uiza.io/#get-aws-upload-key"
    }.freeze

    class << self
      def search keyword
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/search"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {keyword: keyword}
        description_link = OBJECT_API_DESCRIPTION_LINK[:search]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def publish id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/publish"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}
        description_link = OBJECT_API_DESCRIPTION_LINK[:publish]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def get_status_publish id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/publish/status"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_status_publish]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def get_aws_upload_key
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/admin/app/config/aws"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_aws_upload_key]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end
    end
  end
end
