$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sale/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sale"
  s.version     = Sale::VERSION
  s.authors     = ["AlexVangelov"]
  s.email       = ["email@data.bg"]
  s.homepage    = "https://github.com/AlexVangelov/gs"
  s.summary     = "Sale engine for GS"
  s.description = "Sale interface"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
