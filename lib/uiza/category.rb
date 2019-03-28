module Uiza
  class Category
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Delete
    extend Uiza::APIOperation::List

    OBJECT_API_PATH = "media/metadata".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/v4/#create-category",
      retrieve: "https://docs.uiza.io/v4/#retrieve-category",
      list: "https://docs.uiza.io/v4/#list-categories",
      update: "https://docs.uiza.io/v4/#update-a-category",
      delete: "https://docs.uiza.io/v4/#delete-a-category",
      create_relation: "https://docs.uiza.io/v4/#create-category-relation",
      delete_relation: "https://docs.uiza.io/v4/#delete-category-relation"
    }.freeze

    class << self
      def create_relation params
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/media/entity/related/metadata"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        description_link = OBJECT_API_DESCRIPTION_LINK[:create_relation]
        params["appId"] = Uiza.app_id

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def delete_relation params
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/media/entity/related/metadata"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        description_link = OBJECT_API_DESCRIPTION_LINK[:delete_relation]
        params["appId"] = Uiza.app_id

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end
    end
  end
end
