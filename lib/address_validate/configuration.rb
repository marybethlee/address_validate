module AddressValidate
  module Configuration
    API_URLS = {
      test: 'https://production.shippingapis.com/ShippingAPITest.dll',
      production: 'https://production.shippingapis.com/ShippingAPI.dll'
    }

    attr_accessor :environment, :username, :password,
      :firm_name, :street_address, :apartment_number,
      :city, :state, :zip_5, :zip_4

    def configure
      yield self
    end

    def self.extended(base)
      base.set_default_configuration
    end

    def verify_url
      API_URLS[environment]
    end

    def set_default_configuration
      self.environment      = :production
      self.firm_name        = :firm_name
      self.street_address   = :street_address
      self.apartment_number = :apartment_number
      self.city             = :city
      self.state            = :state
      self.zip_5            = :zip_5
      self.zip_4            = :zip_4
    end
  end
end
