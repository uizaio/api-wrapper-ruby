module Uiza
  module Error
    class BadRequestError < UizaError
      DEFAULT_CODE = "400".freeze
      DEFAULT_MESSAGE = "The request was unacceptable, often due to missing a required parameter.".freeze
    end
  end
end
