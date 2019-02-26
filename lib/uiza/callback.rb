module Uiza
  class Callback
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve

    OBJECT_API_PATH = "media/entity/callback".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-a-callback",
      retrieve: "https://docs.uiza.io/#retrieve-a-callback"
    }.freeze
  end
end
