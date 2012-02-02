$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "imperavi-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "imperavi-rails"
  s.version     = ImperaviRails::VERSION
  s.authors     = ["Andrew Kozloff"]
  s.email       = ["demerest@gmail.com"]
  s.homepage    = "https://github.com/tanraya/imperavi-rails"
  s.summary     = ""
  s.description = "Imparavi wysiwyg editor for Rails 3.1+"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.1"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "pry"
  s.add_development_dependency "sqlite3"
end
