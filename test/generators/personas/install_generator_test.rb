# frozen_string_literal: true

require './test/test_helper'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Personas::Generators::InstallGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'assert all files are properly created' do
    run_generator
    assert_file 'config/initializers/personas.rb'
  end
end
