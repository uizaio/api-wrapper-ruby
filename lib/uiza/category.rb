module Uiza
  class Category
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve

    OBJECT_API_PATH = "media/metadata".freeze
  end
end
