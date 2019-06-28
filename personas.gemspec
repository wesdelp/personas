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
end
