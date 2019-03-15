module Uiza
  class Storage
    extend Uiza::APIOperation::Add
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Remove

    OBJECT_API_PATH = "media/storage".freeze

    OBJECT_API_DESCRIPTION_LINK = {
      add: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage-create_storage",
      retrieve: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage-list_storage",
      update: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage-update_storage",
      remove: "https://dev-ap-southeast-1-api.uizadev.io/docs/#api-Media_Storage-delete_storage"
    }.freeze
  end
end
