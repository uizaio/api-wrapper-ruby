module Uiza
  module APIResource
    module EntityResource
      def create_entity params
        Uiza::Entity.create params
      end

      def retrieve_entity id
        Uiza::Entity.retrieve id
      end

      def list_entity params={}
        Uiza::Entity.list params
      end

      def update_entity params
        Uiza::Entity.update params
      end

      def delete_entity id
        Uiza::Entity.delete id
      end

      def search_entity keyword
        Uiza::Entity.search keyword
      end

      def publish_entity id
        Uiza::Entity.publish id
      end

      def get_status_publish_entity id
        Uiza::Entity.get_status_publish id
      end

      def get_aws_upload_key
        Uiza::Entity.get_aws_upload_key
      end
    end
  end
end
