# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "em-test/version"

Gem::Specification.new do |s|
  s.name        = "em-test"
  s.version     = EventMachine::Test::VERSION
  s.authors     = ["Paweł Pacana"]
  s.email       = ["pawel.pacana@gmail.com"]
  s.homepage    = ""
  s.summary     = "TDD for EventMachine"
  s.description = "Simple TDD API for testing asynchronous EventMachine code. Extracted from em-spec to remove dependencies."

  s.rubyforge_project = "em-test"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'eventmachine'
end
