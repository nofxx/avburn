lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'avburn/version'

Gem::Specification.new do |s|
  s.name = "avburn"
  s.version = Avburn::VERSION

  s.authors = ["Marcos Piccinini"]
  s.description = "Read/Write AVR Microcontrollers fuses and memory"
  s.homepage = "http://github.com/nofxx/avburn"
  s.summary = "Read/Write AVR MCU fuses and memory"
  s.email = "x@nofxx.com"

  s.files = Dir.glob("{lib,spec}/**/*") + %w(README.md Rakefile)
  s.require_path = "lib"

  s.rubygems_version = "1.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  # s.add_dependency("shoes", ["~> 2.8.0"])
  # s.add_development_dependency("rspec", ["~> 2.8.0"])
end
