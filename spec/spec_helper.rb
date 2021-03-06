# frozen_string_literal: true

require 'bundler/setup'
require 'pry-byebug'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
require File.expand_path('../lib/personas.rb', __dir__)

# require generators
Dir[File.join(__dir__, '..', 'lib', 'generators', 'personas', '*.rb')].each { |file| require file }

Bundler.setup

RSpec.configure do |config|
  config.include GeneratorTestHelpers

  # setup dummy app for generator tests
  config.before(:all, type: :generator) do
    remove_test_app
    create_test_app
    run_install_generator
  end

  config.after(:all, type: :generator) do
    remove_test_app
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!
  config.warnings = true
  config.order = :random
  Kernel.srand config.seed
end
