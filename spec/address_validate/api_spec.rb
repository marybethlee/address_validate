require 'spec_helper'

RSpec.describe AddressValidate::API do
  let(:usps_response) { AddressValidate::Test::Fixtures.load_fixture('api_response_success.xml') }
  let(:response) { double(body: usps_response) }
  before { allow(Net::HTTP).to receive(:post_form).and_return(response) }

  it 'returns a response object' do
    response = AddressValidate::API.validate_address({})
    expect(response.success?).to be true
  end
end
