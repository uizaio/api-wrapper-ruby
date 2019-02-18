module Uiza
  module Error
    class ServerError < UizaError
      DEFAULT_CODE = "5xx".freeze
      DEFAULT_MESSAGE = "The server is aware that it has encountered an error.".freeze
    end
  end
end
