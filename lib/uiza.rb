require "net/http"
require "net/https"

require "uiza/version"
require "uiza/uiza_client"

require "uiza/api_operations/create"
require "uiza/api_operations/retrieve"
require "uiza/api_operations/list"
require "uiza/api_operations/update"
require "uiza/api_operations/delete"
require "uiza/api_operations/remove"

require "uiza/entity"
require "uiza/storage"

module Uiza
  class << self
    attr_accessor :workspace_api_domain, :authorization
  end
end
