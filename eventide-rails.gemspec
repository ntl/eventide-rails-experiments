$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "eventide/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "eventide-rails"
  spec.version     = Eventide::Rails::VERSION
  spec.authors     = ["Joshua Flanagan"]
  spec.email       = ["joshuaflanagan@gmail.com"]
  spec.homepage    = "https://github.com/eventide-project/eventide-rails"
  spec.summary     = "Rails integration for eventide"
  spec.description = "Rails integration for eventide"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.1"
  spec.add_dependency "message-db", "2.0.0"

  spec.add_development_dependency "pg"
end
