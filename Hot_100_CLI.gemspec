# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Hot_100_CLI/version'

Gem::Specification.new do |spec|
  spec.name          = "Hot_100_CLI"
  spec.version       = Hot100CLI::VERSION
  spec.authors       = ["NStephenson"]
  spec.email         = ["nickstephenson90@gmail.com"]

  spec.summary       = %q{This gem allows users to view the Billboard Top 100 in the command line.}
  spec.description   = %q{This gem scrapes the Billboard Top 100 webpage and displays that information in the command line.}
  spec.homepage      = "https://github.com/NStephenson/Hot_100_CLI"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["Hot100"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "launchy"
  spec.add_dependency "require_all"
  spec.add_dependency "nokogiri"


end
