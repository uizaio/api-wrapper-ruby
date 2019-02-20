module Uiza
  module Error
    class UizaError < StandardError
      attr_reader :description_link
      attr_reader :code
      attr_reader :message

      DEFAULT_CODE = "".freeze
      DEFAULT_MESSAGE = "Unknow Error.".freeze

      def initialize description_link, message = nil, code = nil
        @description_link = description_link
        @message = (message.to_s.empty? ? nil : message) || self.class::DEFAULT_MESSAGE
        @code = (code.to_s.empty? ? nil : code.to_i) || self.class::DEFAULT_CODE
      end
    end
  end
end
