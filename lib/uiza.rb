require "net/http"
require "net/https"
require "json"

require "uiza/version"
require "uiza/uiza_client"

require "uiza/error/uiza_error"
require "uiza/error/bad_request_error"
require "uiza/error/unauthorized_error"
require "uiza/error/not_found_error"
require "uiza/error/unprocessable_error"
require "uiza/error/internal_server_error"
require "uiza/error/service_unavailable_error"
require "uiza/error/client_error"
require "uiza/error/server_error"

require "uiza/api_operations/create"
require "uiza/api_operations/add"
require "uiza/api_operations/retrieve"
require "uiza/api_operations/list"
require "uiza/api_operations/update"
require "uiza/api_operations/delete"
require "uiza/api_operations/remove"

require "uiza/api_resource/entity_resource"

require "uiza/entity"
require "uiza/storage"
require "uiza/category"

module Uiza
  extend Uiza::APIResource::EntityResource

  class << self
    attr_accessor :workspace_api_domain, :authorization
  end
end
