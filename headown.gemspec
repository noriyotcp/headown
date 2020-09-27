require_relative 'lib/headown/version'

Gem::Specification.new do |spec|
  spec.name          = "headown"
  spec.version       = Headown::VERSION
  spec.authors       = ["noriyotcp"]
  spec.email         = ["noriyo.akita@gmail.com"]

  spec.summary       = %q{Extracting headers from Markdown file.}
  spec.description   = %q{Extracting headers from Markdown file.}
  spec.homepage      = "https://github.com/noriyotcp/headown"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/noriyotcp/headown"
  spec.metadata["changelog_uri"] = "https://github.com/noriyotcp/headown/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
