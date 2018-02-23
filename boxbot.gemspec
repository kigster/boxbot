
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boxbot/version'

Gem::Specification.new do |spec|
  spec.name          = 'boxbot'
  spec.version       = Boxbot::VERSION
  spec.authors       = ['Konstantin Gredeskoul']
  spec.email         = ['kigster@gmail.com']

  spec.summary       = 'Boxbot - is a work in progress replacement of the laser-cutter ruby gem'
  spec.description   = 'Boxbot - is a work in progress replacement of the laser-cutter ruby gem'
  spec.homepage      = 'https://github.com/kigster/boxbot'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-configurable'
  spec.add_dependency 'dry-monads'
  spec.add_dependency 'dry-struct'
  spec.add_dependency 'dry-types'
  spec.add_dependency 'hashie'
  spec.add_dependency 'require_dir'
  spec.add_dependency 'victor'

  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
end
