# frozen_string_literal: true

require_relative "lib/prime_numbers/version"

Gem::Specification.new do |spec|
  spec.name = "prime_numbers"
  spec.version = PrimeNumbers::VERSION
  spec.authors = ["Tamara Temple"]
  spec.email = ["tamouse@gmail.com"]

  spec.summary = "Write a short summary, because RubyGems requires one."
  spec.homepage = 'https://github.com/tamouse'
  spec.required_ruby_version = ">= 3.1.1"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "prime" # not StdLib

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
