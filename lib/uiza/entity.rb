module Uiza
  class Entity
    extend Uiza::APIOperations::Create
    extend Uiza::APIOperations::Retrieve

    OBJECT_API_PATH = "media/entity".freeze
  end
end
