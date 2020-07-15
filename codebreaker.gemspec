require_relative 'lib/codebreaker/version'

Gem::Specification.new do |spec|
  spec.name          = 'codebreaker'
  spec.version       = Codebreaker::VERSION
  spec.authors       = ['Dmitriy Shulga']
  spec.email         = ['dimashulga1115@gmail.com']

  spec.summary       = 'Codebreaker gem for RG, winter 2020'
  spec.description   = ''
  spec.homepage      = "https://github.com/dimashulga1115/rg-codebreaker-gem/tree/develop"
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'http://lsamara.com:8808'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "https://github.com/dimashulga1115/rg-codebreaker-gem/tree/develop"
  spec.metadata['changelog_uri'] = "https://github.com/dimashulga1115/rg-codebreaker-gem/tree/develop"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "fasterer"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rspec"
end
