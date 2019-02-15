module Uiza
  module Error
    class UnauthorizedError < UizaError
      DEFAULT_CODE = "401".freeze
      DEFAULT_MESSAGE = "No valid API key provided.".freeze
    end
  end
end
