module Uiza
  module APIResource
    module CategoryResource
      def create_category params
        Uiza::Category.create params
      end

      def retrieve_category id
        Uiza::Category.retrieve id
      end

      def update_category params
        Uiza::Category.update params
      end
    end
  end
end
