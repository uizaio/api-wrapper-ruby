require "net/http"
require "net/https"
require "json"

require "uiza/version"
require "uiza/uiza_client"
require "uiza/uiza_open_struct"

require "uiza/error/uiza_error"
require "uiza/error/bad_request_error"
require "uiza/error/unauthorized_error"
require "uiza/error/not_found_error"
require "uiza/error/unprocessable_error"
require "uiza/error/internal_server_error"
require "uiza/error/service_unavailable_error"
require "uiza/error/client_error"
require "uiza/error/server_error"

require "uiza/api_operation/create"
require "uiza/api_operation/add"
require "uiza/api_operation/retrieve"
require "uiza/api_operation/list"
require "uiza/api_operation/update"
require "uiza/api_operation/delete"
require "uiza/api_operation/remove"

require "uiza/entity"
require "uiza/storage"
require "uiza/category"
require "uiza/live"
require "uiza/callback"

module Uiza
  class << self
    attr_accessor :workspace_api_domain, :authorization
  end
end
