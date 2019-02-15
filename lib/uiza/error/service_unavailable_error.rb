module Uiza
  module Error
    class ServiceUnavailableError < UizaError
      DEFAULT_CODE = "503".freeze
      DEFAULT_MESSAGE = "The server is overloaded or down for maintenance.".freeze
    end
  end
end
