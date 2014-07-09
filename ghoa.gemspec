Gem::Specification.new do |s|
  s.name = "ghoa"
  s.version = "0.0.1"
  s.summary = "Ruby gem for simple GitHub authentication"
  s.description = s.summary
  s.authors = ["Mayn Kjær", "Cecilia Rivero"]
  s.email = ["mayn.kjaer@gmail.com", "contact@ceciliarivero.com"]
  s.homepage = "https://github.com/punchgirls/ghoa"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")

  s.add_dependency "requests"
  s.add_development_dependency "cutest"
end