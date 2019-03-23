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
      start_feed: "https://docs.uiza.io/#start-a-live-feed",
      list_recorded: "https://docs.uiza.io/#list-all-recorded-files",
      stop_feed: "https://docs.uiza.io/#stop-a-live-feed",
      get_view: "https://docs.uiza.io/#get-view-of-live-feed",
      delete: "https://docs.uiza.io/#delete-a-record-file",
      convert_to_vod: "https://docs.uiza.io/#convert-into-vod"
    }.freeze

    class << self
      def start_feed id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/feed"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}

        uiza_client = UizaClient.new url, method, headers, params, OBJECT_API_DESCRIPTION_LINK[:start_feed]
        uiza_client.execute_request
      end

      def get_view id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/tracking/current-view"
        method = :get
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}
        description_link = OBJECT_API_DESCRIPTION_LINK[:get_view]

        uiza_client = UizaClient.new url, method, headers, params, description_link
        uiza_client.execute_request
      end

      def stop_feed id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/feed"
        method = :put
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}

        uiza_client = UizaClient.new url, method, headers, params, OBJECT_API_DESCRIPTION_LINK[:stop_feed]
        uiza_client.execute_request
      end

      def list_recorded params = {}
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/dvr"
        method = :get
        headers = {"Authorization" => Uiza.authorization}

        uiza_client = UizaClient.new url, method, headers, params, OBJECT_API_DESCRIPTION_LINK[:list_recorded]
        uiza_client.execute_request
      end

      def delete id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/dvr"
        method = :delete
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}

        uiza_client = UizaClient.new url, method, headers, params, OBJECT_API_DESCRIPTION_LINK[:delete]
        uiza_client.execute_request
      end

      def convert_to_vod id
        url = "https://#{Uiza.workspace_api_domain}/api/public/v3/#{OBJECT_API_PATH}/dvr/convert-to-vod"
        method = :post
        headers = {"Authorization" => Uiza.authorization}
        params = {id: id}

        uiza_client = UizaClient.new url, method, headers, params, OBJECT_API_DESCRIPTION_LINK[:convert_to_vod]
        uiza_client.execute_request
      end
    end
  end
end
