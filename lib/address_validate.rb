require 'address_validate/version'
require 'address_validate/configuration'
require 'ox'

module AddressValidate
  extend Configuration

  ADDRESS_FIELDS_MAP = {
    'FirmName' => AddressValidate.firm_name,
    'Address1' => AddressValidate.apartment_number,
    'Address2' => AddressValidate.street_address,
    'City'     => AddressValidate.city,
    'State'    => AddressValidate.state,
    'Zip5'     => AddressValidate.zip_5,
    'Zip4'     => AddressValidate.zip_4
  }
end
