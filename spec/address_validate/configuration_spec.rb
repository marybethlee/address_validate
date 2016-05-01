require 'spec_helper'

RSpec.describe AddressValidate::Configuration do
  describe 'basic configuration assignment' do
    let(:set_value) { 'custom_value' }

    before {
      AddressValidate.configure do |config|
        config.environment      = :test
        config.firm_name        = set_value
        config.street_address   = set_value
        config.apartment_number = set_value
        config.city  = set_value
        config.state = set_value
        config.zip_5 = set_value
        config.zip_4 = set_value
      end
    }

    it { expect(AddressValidate.environment).to      eq :test }
    it { expect(AddressValidate.firm_name).to        eq set_value }
    it { expect(AddressValidate.street_address).to   eq set_value }
    it { expect(AddressValidate.apartment_number).to eq set_value }
    it { expect(AddressValidate.city).to  eq set_value }
    it { expect(AddressValidate.state).to eq set_value }
    it { expect(AddressValidate.zip_5).to eq set_value }
    it { expect(AddressValidate.zip_4).to eq set_value }

    it { expect(AddressValidate.verify_url).to eq described_class::API_URLS[:test] }
  end
end
