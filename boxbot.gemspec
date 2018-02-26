lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boxbot/version'

Gem::Specification.new do |spec|
  spec.name          = 'boxbot'
  spec.version       = Boxbot::VERSION
  spec.authors       = ['Konstantin Gredeskoul']
  spec.email         = ['kigster@gmail.com']

  BOXBOT__SUMMARY    = 'BoxBot aims to generate an SVG or PDF template that is
                        meant to be used with a laser cutter. Boxbot will generate
                        a 2D cut layout for a 3D box (parallelepiped) with matching
                        tabs that allow the box to be "snapped into place" without screws,
                        although screws and T-joins can also be added. This gem is
                        currently a "work in progress", and represents a hopeful rewrite
                        of the laser-cutter gem also by the same author.'.gsub(/\n\s+/, ' ')

  spec.summary       = BOXBOT__SUMMARY
  spec.description   = BOXBOT__SUMMARY
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
  spec.add_dependency 'dry-transaction'
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
