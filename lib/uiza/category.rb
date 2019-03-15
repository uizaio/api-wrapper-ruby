module Uiza
  class Category
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Delete
    extend Uiza::APIOperation::List

    OBJECT_API_PATH = "media/metadata".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Metadata-create_metadata",
      retrieve: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Metadata-get_metadata",
      list: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Metadata-get_metadata",
      update: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Metadata-update_metadata",
      delete: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Metadata-delete_metadata",
      create_relation: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Metadata-create_n_metadata_for_one_entiy",
      delete_relation: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Metadata-delete_n_metadata_for_one_entiy"
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
