module Uiza
  class User
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::List

    OBJECT_API_PATH = "admin/user".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-an-user",
      retrieve: "https://docs.uiza.io/#retrieve-an-user",
      list: "https://docs.uiza.io/#list-all-users",
      change_password: "https://docs.uiza.io/#update-password"
    }.freeze

    class << self
      def change_password params
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/changepassword"
        method = :post
        headers = {"Authorization" => Uiza.authorization}

        uiza_client = UizaClient.new url, method, headers, params, OBJECT_API_DESCRIPTION_LINK[:change_password]
        uiza_client.execute_request
      end
    end
  end
end
