module Uiza
  class Callback
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Delete

    OBJECT_API_PATH = "media/entity/callback".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-a-callback",
      retrieve: "https://docs.uiza.io/#retrieve-a-callback",
      update: "https://docs.uiza.io/#update-a-callback",
      delete: "https://docs.uiza.io/#delete-a-callback"
    }.freeze
  end
end
