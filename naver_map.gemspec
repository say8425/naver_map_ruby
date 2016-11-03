# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'naver_map/version'

Gem::Specification.new do |spec|
  spec.name          = "naver_map"
  spec.version       = NaverMap::VERSION
  spec.author        = "Penguin"
  spec.email         = "say8425@gmail.com"

  spec.summary       = "Generating Naver map API"
  spec.description   = "Naver support map API. But we don't have any ruby gem for this API.
                        So You can use it with this gem comfortable."
  spec.homepage      = "https://github.com/say8425/naver_map_ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "rest-client", "~> 2.0.0", ">=2.0.0"
end
