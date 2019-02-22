module Uiza
  class Callback
    extend Uiza::APIOperation::Retrieve

    OBJECT_API_PATH = "media/entity/callback".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      retrieve: "https://docs.uiza.io/#retrieve-a-callback"
    }.freeze
  end
end
