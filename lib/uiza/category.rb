module Uiza
  class Category
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Delete
    extend Uiza::APIOperation::List

    OBJECT_API_PATH = "media/metadata".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-category",
      retrieve: "https://docs.uiza.io/#retrieve-category",
      list: "https://docs.uiza.io/#retrieve-category-list",
      update: "https://docs.uiza.io/#update-category",
      delete: "https://docs.uiza.io/#delete-category",
      create_relation: "https://docs.uiza.io/#create-category-relation",
      delete_relation: "https://docs.uiza.io/#delete-category-relation"
    }.freeze

    class << self
      def create_relation entity_id, metadata_ids
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/media/entity/related/metadata"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {entityId: entity_id, metadataIds: metadata_ids}
        description_link = OBJECT_API_DESCRIPTION_LINK[:create_relation]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def delete_relation entity_id, metadata_ids
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/media/entity/related/metadata"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {entityId: entity_id, metadataIds: metadata_ids}
        description_link = OBJECT_API_DESCRIPTION_LINK[:delete_relation]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end
    end
  end
end
