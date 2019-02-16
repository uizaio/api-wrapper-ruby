module Uiza
  class Storage
    extend Uiza::APIOperation::Add
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Remove

    OBJECT_API_PATH = "media/storage".freeze
  end
end
