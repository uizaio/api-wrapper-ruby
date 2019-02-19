module Uiza
  module APIResource
    module CategoryResource
      def create_category params
        Uiza::Category.create params
      end

      def retrieve_category id
        Uiza::Category.retrieve id
      end

      def list_category params = {}
        Uiza::Category.list params
      end

      def update_category params
        Uiza::Category.update params
      end

      def delete_category id
        Uiza::Category.delete id
      end
    end
  end
end
