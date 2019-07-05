# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Personas::CreateGenerator do
  before(:all) do
    remove_test_app
    create_test_app
    run_install_generator
    run_create_generator('admin')
  end

  after(:all) do
    remove_test_app
  end

  it 'creates a personas models file' do
    expect(File).to exist("#{dummy_app_path}/app/models/personas/admin.rb")
  end

  it 'creates a controller directory and example file' do
    expect(File).to exist("#{dummy_app_path}/app/controllers/admin/example_controller.rb")
  end

  it 'creates a view directory and an example file' do
    expect(File).to exist("#{dummy_app_path}/app/views/admin/example/index.html")
  end
end
