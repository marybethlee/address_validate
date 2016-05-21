require 'address_validate/version'
require 'address_validate/configuration'
require 'address_validate/api'
require 'address_validate/api/request'
require 'address_validate/api/response'
require 'address_validate/api/error'
require 'ox'

module AddressValidate
  extend Configuration

  def self.address_fields_map
    {
      'FirmName' => AddressValidate.firm_name,
      'Address1' => AddressValidate.apartment_number,
      'Address2' => AddressValidate.street_address,
      'City'     => AddressValidate.city,
      'State'    => AddressValidate.state,
      'Zip5'     => AddressValidate.zip_5,
      'Zip4'     => AddressValidate.zip_4
    }
  end
end
