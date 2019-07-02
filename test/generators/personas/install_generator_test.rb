# frozen_string_literal: true

require './test/test_helper'
require 'pry-byebug'

class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelpers

  class_attribute :install_destination

  tests Personas::Generators::InstallGenerator
  destination File.expand_path('./test/tmp', File.dirname(__FILE__))

  remove_generator_sample_app
  create_generator_sample_app

  Minitest.after_run do
    remove_generator_sample_app
  end

  setup do
    run_generator
  end

  test 'assert all files are properly created' do
    assert_file 'config/initializers/personas.rb'
  end
end
