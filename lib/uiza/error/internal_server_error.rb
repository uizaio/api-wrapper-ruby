module Uiza
  module Error
    class InternalServerError < UizaError
      DEFAULT_CODE = "500".freeze
      DEFAULT_MESSAGE = "We had a problem with our server. Try again later.".freeze
    end
  end
end
