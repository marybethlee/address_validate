require 'spec_helper'

RSpec.describe AddressValidate::API::Request do
  let(:data) {
    { 'firm_name'        => 'Company ABC',
      'street_address'   => '123 Main St',
      'apartment_number' => 'Suite A',
      'city'             => 'Brooklyn',
      'state'            => 'NY',
      'zip_5'            => '11222',
      'zip_4'            => '1122' }
  }

  let(:request) { described_class.new(data) }

  it 'builds and dumps xml with the passed data' do
    xml = request.build_xml
    expect(xml).to_not be_nil

    parsed = Ox.parse(xml)
    expect(parsed.Address.FirmName.text).to eq data['firm_name']
    expect(parsed.Address.Address2.text).to eq data['street_address']
    expect(parsed.Address.Address1.text).to eq data['apartment_number']
    expect(parsed.Address.City.text).to     eq data['city']
    expect(parsed.Address.State.text).to    eq data['state']
    expect(parsed.Address.Zip5.text).to     eq data['zip_5']
    expect(parsed.Address.Zip4.text).to     eq data['zip_4']
  end
end
