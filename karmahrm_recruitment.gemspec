$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "karmahrm_recruitment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "karmahrm_recruitment"
  s.version     = SimplehrRecruitment::VERSION
  s.authors     = ["sobin"]
  s.email       = ["sobisunny@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of SimplehrRecruitment."
  s.description = "Description of SimplehrRecruitment."
  s.license     = "LGPL"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "4.2.7.1"
  s.add_dependency 'rails-observers'
  s.add_dependency 'workflow'

  s.add_development_dependency "sqlite3"
end
