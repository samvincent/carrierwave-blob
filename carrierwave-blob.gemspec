# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "carrierwave-blob"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.summary       = "BLOB support for Carrierwave"
  s.authors       = [ 'Karel Minarik', 'Vojtech Hyza' ]
  s.email         = [ 'karmi@karmi.cz', 'vhyza@vhyza.eu' ]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.require_paths = ["."]

  s.add_dependency "carrierwave"
end
