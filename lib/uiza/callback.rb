module Uiza
  class Callback
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Delete

    OBJECT_API_PATH = "media/entity/callback".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/v4/#create-a-callback",
      retrieve: "https://docs.uiza.io/v4/#retrieve-a-callback",
      update: "https://docs.uiza.io/v4/#update-a-callback",
      delete: "https://docs.uiza.io/v4/#delete-a-callback"
    }.freeze
  end
end
