module Uiza
  class Callback
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Delete

    OBJECT_API_PATH = "media/entity/callback".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Callback-create_entity_callback",
      retrieve: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Callback-get_entity_callback",
      update: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Callback-update_entity_callback",
      delete: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Callback-delete_entity_callback"
    }.freeze
  end
end
