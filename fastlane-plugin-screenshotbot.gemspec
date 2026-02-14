lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/screenshotbot/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-screenshotbot'
  spec.version       = Fastlane::Screenshotbot::VERSION
  spec.author        = 'Apadmi Limited'
  spec.email         = 'opensource@apadmi.com'

  spec.summary       = 'Fastlane plugin to install the Screenshotbot recorder tool and upload your screenshots'
  spec.homepage      = "https://github.com/Apadmi-Engineering/fastlane-plugin-screenshotbot"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.2'

  spec.add_dependency('fastlane', '>= 2.232.1')

  spec.metadata['rubygems_mfa_required'] = 'true'
end
