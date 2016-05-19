# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'address_validate/version'

Gem::Specification.new do |spec|
  spec.name          = "address_validate"
  spec.version       = AddressValidate::VERSION
  spec.authors       = ["Mary Lee"]
  spec.email         = ["marybethlee11@gmail.com"]

  spec.summary       = %q{USPS address validation api integration}
  spec.description   = %q{AddressValidate is a ruby wrapper for integrating with the USPS address validation api.}
  spec.homepage      = "https://github.com/marybethlee/address_validate"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ox"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
