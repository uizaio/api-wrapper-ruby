module Uiza
  class Storage
    extend Uiza::APIOperation::Add
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Remove

    OBJECT_API_PATH = "media/storage".freeze

    OBJECT_API_DESCRIPTION_LINK = {
      add: "https://docs.uiza.io/#add-a-storage",
      retrieve: "https://docs.uiza.io/#retrieve-a-storage",
      update: "https://docs.uiza.io/#update-storage",
      remove: "https://docs.uiza.io/#remove-storage"
    }.freeze
  end
end
