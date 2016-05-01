$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'address_validate'

module AddressValidate::Test
  module Fixtures
    def self.load_fixture(path) # where path is like 'api_error.xml'
      File.read(File.join(File.dirname(__FILE__), 'fixtures', path))
    end
  end
end
