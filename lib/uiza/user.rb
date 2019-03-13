module Uiza
  class User
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::List
    extend Uiza::APIOperation::Update
    extend Uiza::APIOperation::Delete

    OBJECT_API_PATH = "admin/user".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-an-user",
      retrieve: "https://docs.uiza.io/#retrieve-an-user",
      list: "https://docs.uiza.io/#list-all-users",
      update: "https://docs.uiza.io/#update-an-user",
      delete: "https://docs.uiza.io/#delete-an-user",
      change_password: "https://docs.uiza.io/#update-password",
      logout: "https://docs.uiza.io/#log-out"
    }.freeze

    class << self
      def change_password params
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{OBJECT_API_PATH}/changepassword"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params["appId"] = Uiza.app_id

        uiza_client = UizaClient.new url, method, headers, params, OBJECT_API_DESCRIPTION_LINK[:change_password]
        uiza_client.execute_request
      end

      def logout
        url = "https://#{Uiza.workspace_api_domain}/api/public/#{Uiza.api_version}/#{OBJECT_API_PATH}/logout"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {appId: Uiza.app_id}

        uiza_client = UizaClient.new url, method, headers, params, OBJECT_API_DESCRIPTION_LINK[:logout]
        uiza_client.execute_request
      end
    end
  end
end
