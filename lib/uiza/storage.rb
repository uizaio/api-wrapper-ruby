module Uiza
  class Storage
    extend Uiza::APIOperation::Add
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Remove

    OBJECT_API_PATH = "media/storage".freeze

    OBJECT_API_DESCRIPTION_LINK = {
      add: "https://docs.uiza.io/v4/#add-a-storage",
      retrieve: "https://docs.uiza.io/v4/#retrieve-a-storage",
      update: "https://docs.uiza.io/v4/#update-storage",
      remove: "https://docs.uiza.io/v4/#delete-a-storage"
    }.freeze
  end
end
