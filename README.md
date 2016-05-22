# AddressValidate

A ruby gem for integrating with the USPS address validation API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'address_validate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install address_validate

## Configuration

The USPS address validation api requires a valid username. It will need to be set in order for calls to be made:

```ruby
# config/initializers/address_validate.rb
AddressValidate.configure do |config|
  config.environment = :test # or :production
  config.username    = 'MY_USPS_USERNAME'
end
```

## Usage

```ruby
address_data = { street_address: '34 Berry', zip_5: '11249' }

response = AddressValidate::API.validate_address(address_data)

response.success? # => true

response.data # => { street_address: '34 BERRY ST', city: 'BROOKLYN', state: 'NY', zip_5: '11249' }

response.error # => nil

response.message # => 'Default address: The address you entered was found but more information is needed...'
```

If you want to override the default fields for address data, you can do that during configuration

```ruby
# config/initializers/address_validate.rb
AddressValidate.configure do |config|
  config.environment      = :test # or :production
  config.username         = 'MY_USPS_USERNAME'
  config.street_address   = :address_1
  config.apartment_number = :address_2
  config.zip_5            = :postal_code
end
```

You can then send your address data with your field names to the API, and will receive matching data back.

```ruby
address_data = { address_1: '34 Berry', postal_code: '11249' }

response = AddressValidate::API.validate_address(address_data)

response.data # => { address_1: '34 BERRY ST', city: 'BROOKLYN', state: 'NY', postal_code: '11249' }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marybethlee/address_validate.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

