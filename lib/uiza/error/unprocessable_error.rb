module Uiza
  module Error
    class UnprocessableError < UizaError
      DEFAULT_CODE = "422".freeze
      DEFAULT_MESSAGE = "The syntax of the request is correct (often cause of wrong parameter).".freeze
    end
  end
end
