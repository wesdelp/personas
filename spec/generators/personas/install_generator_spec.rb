# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Personas::InstallGenerator do
  before(:all) do
    remove_test_app
    create_test_app
    run_install_generator
  end

  after(:all) do
    remove_test_app
  end

  it 'creates an personas initializer file' do
    expect(File).to exist("#{dummy_app_path}/config/initializers/personas.rb")
  end

  it 'creates an app/models/personas directory' do
    expect(File).to be_directory("#{dummy_app_path}/app/models/personas")
  end
end
