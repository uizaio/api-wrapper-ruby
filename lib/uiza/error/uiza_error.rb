module Uiza
  module Error
    class UizaError < StandardError
      attr_reader :description_link
      attr_reader :code
      attr_reader :message

      DEFAULT_CODE = "".freeze
      DEFAULT_MESSAGE = "Unknow Error".freeze

      def initialize description_link, code = nil, message = nil
        @description_link = description_link
        @code = code || self.class::DEFAULT_CODE
        @message = message || self.class::DEFAULT_MESSAGE
      end
    end
  end
end
