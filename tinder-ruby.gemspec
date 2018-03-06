
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "tinder-ruby"
  spec.version       = "0.1.1"
  spec.authors       = ["ts-3156"]
  spec.email         = ["ts_3156@yahoo.co.jp"]

  spec.summary       = "A Ruby interface to the Tinder API"
  spec.description   = "A Ruby interface to the Tinder API"
  spec.homepage      = "https://github.com/ts-3156/tinder-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.11.3"

  spec.add_runtime_dependency "dotenv", "~> 2.2.1"
end
