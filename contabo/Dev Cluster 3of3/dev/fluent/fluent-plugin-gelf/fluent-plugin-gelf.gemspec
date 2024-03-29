# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "fluent-plugin-gelf"
  s.version     = "0.1.0"
  s.authors     = ["Eric Searcy"]
  s.email       = ["emsearcy@gmail.com"]
  s.homepage    = "https://github.com/emsearcy/fluent-plugin-gelf"
  s.summary     = "Buffered fluentd output plugin to GELF (Graylog2)"
  s.description = s.summary
  s.licenses    = ["Apache-2.0"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.comsename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "fluentd"
  s.add_runtime_dependency "gelf"
  s.add_runtime_dependency "string-scrub" if RUBY_VERSION.to_f < 2.1
  s.add_development_dependency "rake"
  s.add_development_dependency "test-unit"
end
