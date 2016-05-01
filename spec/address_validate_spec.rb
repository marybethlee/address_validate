require 'spec_helper'

describe AddressValidate do
  it 'has a version number' do
    expect(AddressValidate::VERSION).not_to be nil
  end

  it 'can be configured' do
    expect(AddressValidate).to respond_to(:configure)
  end
end
