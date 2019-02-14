module Uiza
  class Storage
    extend Uiza::APIOperations::Retrieve
    extend Uiza::APIOperations::Remove

    OBJECT_API_PATH = "media/storage".freeze
  end
end
