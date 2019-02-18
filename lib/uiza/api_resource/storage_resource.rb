module Uiza
  module APIResource
    module StorageResource
      def add_storage params
        Uiza::Storage.add params
      end

      def retrieve_storage id
        Uiza::Storage.retrieve id
      end

      def update_storage params
        Uiza::Storage.update params
      end

      def remove_storage id
        Uiza::Storage.remove id
      end
    end
  end
end
