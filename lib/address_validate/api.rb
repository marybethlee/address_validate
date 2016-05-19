require 'net/http'
require 'uri'

module AddressValidate
  module API
    def self.validate_address(data)
      response = Net::HTTP.post_form(URI(AddressValidate.verify_url),
        { API: 'Verify',
          XML: Request.build_xml(data) })
      Response.new(response.body)
    end
  end
end
