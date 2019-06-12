module Uiza
  class Entity
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::List
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Delete

    OBJECT_API_PATH = "media/entity".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/v4/#create-entity",
      retrieve: "https://docs.uiza.io/v4/#retrieve-an-entity",
      list: "https://docs.uiza.io/v4/#list-entities",
      update: "https://docs.uiza.io/v4/#update-an-entity",
      delete: "https://docs.uiza.io/v4/#delete-an-entity",
      search: "https://docs.uiza.io/v4/#search-entity",
      publish: "https://docs.uiza.io/v4/#publish-entity-to-cdn",
      get_status_publish: "https://docs.uiza.io/v4/#get-publish-status",
      get_aws_upload_key: "https://docs.uiza.io/v4/#get-aws-upload-key"
    }.freeze

    class << self
      def search keyword
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{OBJECT_API_PATH}/search"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {keyword: keyword}
        description_link = OBJECT_API_DESCRIPTION_LINK[:search]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def publish id
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{OBJECT_API_PATH}/publish"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}
        description_link = OBJECT_API_DESCRIPTION_LINK[:publish]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def get_status_publish id
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{OBJECT_API_PATH}/publish/status"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_status_publish]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def get_aws_upload_key
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/admin/app/config/aws"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_aws_upload_key]

        uiza_client = UizaClient.new url, method, headers, nil, description_link
        uiza_client.execute_request
      end
    end
  end
end
