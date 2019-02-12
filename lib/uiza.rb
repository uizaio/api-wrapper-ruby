require "net/http"
require "net/https"

require "uiza/version"
require "uiza/uiza_client"

require "uiza/api_operations/create"

require "uiza/entity"

module Uiza
  class << self
    attr_accessor :workspace_api_domain, :authorization
  end
end
