# frozen_string_literal: true

require 'spec_helper'
require 'pry-byebug'

RSpec.describe Personas::Generators::InstallGenerator do
  before(:all) do
    remove_test_app
    create_test_app
  end

  after(:all) do
    remove_test_app
  end

  it 'creates an initializer_file' do
    run_install_generator
    expect(File).to exist("#{dummy_app_path}/config/initializers/personas.rb")
  end
end
