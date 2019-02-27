module Uiza
  class User
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::List

    OBJECT_API_PATH = "admin/user".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-an-user",
      retrieve: "https://docs.uiza.io/#retrieve-an-user",
      list: "https://docs.uiza.io/#list-all-users"
    }.freeze
  end
end
