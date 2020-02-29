
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "xencoder/version"

Gem::Specification.new do |spec|
  spec.name          = "xencoder"
  spec.version       = Xencoder::VERSION
  spec.authors       = ["xiaohui"]
  spec.email         = ["xiaohui@tanmer.com"]

  spec.summary       = %q{Encode number to fixed length of characters}
  spec.description   = %q{Encode number to fixed length of characters, characters can be any digits, alphabets, symbols or even Chinese}
  spec.homepage      = "https://github.com/xiaohui-zhangxh/xencoder"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
