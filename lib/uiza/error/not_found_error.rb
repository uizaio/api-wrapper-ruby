module Uiza
  module Error
    class NotFoundError < UizaError
      DEFAULT_CODE = 404
      DEFAULT_MESSAGE = "The requested resource doesn't exist.".freeze
    end
  end
end
