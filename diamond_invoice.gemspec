# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "diamond_invoice/version"

Gem::Specification.new do |s|
  s.name        = "diamond_invoice"
  s.version     = DiamondInvoice::VERSION
  s.authors     = ["Jon Canady"]
  s.email       = ["jon@joncanady.com"]
  s.homepage    = ""
  s.summary     = "Reads the Diamond Comic Distributor email invoice."
  s.description = %q{Parses and extracts useful information from Diamond Comic Distributor's invoice files.}

  # wtf?
  s.rubyforge_project = "diamond_invoice"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~> 2.7"
  # s.add_runtime_dependency "rest-client"
end
