module Uiza
  class Entity
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::List
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Delete

    OBJECT_API_PATH = "media/entity".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-create_entity",
      retrieve: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-get_entity",
      list: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-get_entity",
      update: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-update_entity",
      delete: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-delete_entity",
      search: "https://docs.uiza.io/#search-entity",
      publish: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-post_transcode_standard",
      get_status_publish: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media-get_publish_cdn_status",
      get_aws_upload_key: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-App-get_aws_key"
    }.freeze

    class << self
      def search keyword
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{OBJECT_API_PATH}/search"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {keyword: keyword, appId: Uiza.app_id}
        description_link = OBJECT_API_DESCRIPTION_LINK[:search]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def publish id
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{OBJECT_API_PATH}/publish"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id, appId: Uiza.app_id}
        description_link = OBJECT_API_DESCRIPTION_LINK[:publish]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def get_status_publish id
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{OBJECT_API_PATH}/publish/status"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id, appId: Uiza.app_id}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_status_publish]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def get_aws_upload_key
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/admin/app/config/aws"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {"appId" => Uiza.app_id}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_aws_upload_key]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end
    end
  end
end
