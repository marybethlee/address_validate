require 'spec_helper'

RSpec.describe AddressValidate::API::Error do
  let(:fixture)   { AddressValidate::Test::Fixtures.load_fixture('api_error.xml') }
  let(:parsed_xml) { Ox.parse(fixture) }
  let(:error)     { described_class.new(parsed_xml) }

  it 'returns description text from the error' do
    expect(error.message).to eq 'Multiple addresses were found for the information you entered, and no default exists.'
  end

  it 'returns the error code' do
    expect(error.code).to eq '-2147219403'
  end

  it 'returns the error source' do
    expect(error.source).to eq 'clsAMS'
  end
end
