module Uiza
  module Error
    class ClientError < UizaError
      DEFAULT_CODE = "4xx".freeze
      DEFAULT_MESSAGE = "The error seems to have been caused by the client.".freeze
    end
  end
end
