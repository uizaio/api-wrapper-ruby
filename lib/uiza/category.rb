module Uiza
  class Category
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update

    OBJECT_API_PATH = "media/metadata".freeze

    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-category",
      retrieve: "https://docs.uiza.io/#retrieve-category",
      update: "https://docs.uiza.io/#update-category"
    }.freeze
  end
end
