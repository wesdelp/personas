# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'personas/version'

Gem::Specification.new do |s|
  s.name          = 'personas'
  s.version       = Personas::VERSION
  s.licenses    = ['MIT']
  s.summary     = 'Isolate your Rails applications'
  s.description = 'Some description'
  s.authors     = ['Wes Delp', 'Braden Polly']
  s.email       = 'wdelp@covermymeds.com'
  s.files       = ['lib/personas.rb']
  s.homepage    = 'https://rubygems.org/gems/example'
  s.metadata    = { 'source_code_uri' => 'https://git.innova-partners.com/wdelp/personas' }

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-performance'
  s.add_development_dependency 'rubocop-rspec'
  s.add_runtime_dependency 'pry-byebug'

  s.add_runtime_dependency 'activesupport'
  s.add_runtime_dependency 'rack', '~> 2.0'
  s.add_runtime_dependency 'rails', '~> 5.2'
end
