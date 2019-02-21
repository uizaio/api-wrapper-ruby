module Uiza
  class Live
    extend Uiza::APIOperation::Create
    extend Uiza::APIOperation::Retrieve
    extend Uiza::APIOperation::Update

    OBJECT_API_PATH = "live/entity".freeze
    OBJECT_API_DESCRIPTION_LINK = {
      create: "https://docs.uiza.io/#create-a-live-event",
      retrieve: "https://docs.uiza.io/#retrieve-a-live-event",
      update: "https://docs.uiza.io/#update-a-live-event",
      start_feed: "https://docs.uiza.io/#start-a-live-feed"
    }.freeze

    class << self
      def start_feed id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/feed"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}

        uiza_client = UizaClient.new url, method, headers, params, OBJECT_API_DESCRIPTION_LINK[:start_feed]
        response = uiza_client.execute_request

        retrieve response.id
      end
    end
  end
end
