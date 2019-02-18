module Uiza
  class Category
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve

    OBJECT_API_PATH = "media/metadata".freeze

    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-category",
      retrieve: "https://docs.uiza.io/#retrieve-category"
    }.freeze
  end
end
