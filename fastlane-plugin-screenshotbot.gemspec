lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/screenshotbot/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-screenshotbot'
  spec.version       = Fastlane::Screenshotbot::VERSION
  spec.author        = 'Apadmi Limited'
  spec.email         = 'opensource@apadmi.com'

  spec.summary       = 'Fastlane pluging to install the Screenshotbot recorder tool and upload your screenshots'
  spec.homepage      = "https://github.com/Apadmi-Engineering/fastlane-plugin-screenshotbot"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3'

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('fastlane', '>= 2.211.0')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rubocop', '1.12.1')
  spec.add_development_dependency('rubocop-performance')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
end
