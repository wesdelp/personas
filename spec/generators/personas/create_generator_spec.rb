# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Personas::CreateGenerator, type: :generator do
  before(:all) { run_create_generator('admin') }

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
