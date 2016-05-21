require 'spec_helper'

RSpec.describe AddressValidate::API::Response do
  context 'with valid address' do
    let(:success_fixture) { AddressValidate::Test::Fixtures.load_fixture('api_response_success.xml') }
    let(:response) { described_class.new(success_fixture) }

    it 'is considered a success' do
      expect(response).to be_success
    end

    it 'does not have an error' do
      expect(response.error).to be_nil
    end

    it 'may contain a warning' do
      expect(response.warning).to_not be_nil
    end

    it 'parses the return xml into a usable data hash' do
      expect(response.data[:street_address]).to_not be_nil
    end
  end

  context 'with invalid address' do
    let(:failure_fixture) { AddressValidate::Test::Fixtures.load_fixture('api_response_failure.xml') }
    let(:response) { described_class.new(failure_fixture) }

    it 'is not considered a success' do
      expect(response).to_not be_success
    end

    it 'will return an error' do
      expect(response.error.class).to eq AddressValidate::API::Error
    end

    it 'does not contain a warning' do
      expect(response.warning).to be_nil
    end

    it 'does not return any data' do
      expect(response.data).to be_empty
    end
  end
end
