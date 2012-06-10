require "rubygems"
require "parka/specification"
require "./lib/mockup.rb"

Parka::Specification.new do |gem|
  gem.name             = "mockup-service"
  gem.version          = MockUp::VERSION
  gem.summary          = "Mock-up computational service"
  gem.homepage         = "http://trac.kocur.olorin.info/projects/xen"
  gem.author           = "Kamil Figiela, Paweł Pietraszko"
  gem.email            = "fkamil@student.agh.edu.pl"
  gem.executables      = "mockup"            
  gem.files            = Dir.glob ["Gemfile", "Gemfile.lock", "README.rdoc", "bin/*", "lib/*", "lib/*/*", "lib/*/*/*", "example/*"]
  gem.extra_rdoc_files = "README.rdoc"    
  gem.rdoc_options     = ["--line-numbers", "--inline-source", "--title", "mockup-service", "--main", "README.rdoc"]
end