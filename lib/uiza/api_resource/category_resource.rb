module Uiza
  module APIResource
    module CategoryResource
      def create_category params
        Uiza:: Category.create params
      end

      def retrieve_category id
        Uiza:: Category.retrieve id
      end
    end
  end
end
