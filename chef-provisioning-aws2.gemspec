# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chef/provisioning/aws2/version'

Gem::Specification.new do |spec|
  spec.name          = "chef-provisioning-aws2"
  spec.version       = Chef::Provisioning::Aws2::VERSION
  spec.authors       = ["Alberto Tablado"]
  spec.email         = ["alberto@aluki.org"]

  spec.summary       = %q{Chef provisioning using AWS Ruby SDK V2}
  spec.description   = File.read "README.md"
  spec.homepage      = "https://github.com/aluki/chef-provisioning-aws2"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://gems.aluki.net'
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'chef', '>= 12'
  spec.add_dependency 'chef-provisioning', '~> 0.19'
  spec.add_dependency 'aws-sdk', '>= 2'

end
