module Uiza
  class Entity
    extend Uiza::APIOperations::Create
    extend Uiza::APIOperations::Retrieve
    extend Uiza::APIOperations::List
    extend Uiza::APIOperations::Update

    OBJECT_API_PATH = "media/entity".freeze
  end
end
