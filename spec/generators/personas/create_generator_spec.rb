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

  it 'injects a route helper into config/routes.rb' do
    routes_files = IO.read("#{dummy_app_path}/config/routes.rb")

    expect(routes_files).to match(/#{route_block}/)
  end

  def route_block
    [
      '  for_persona :admin do',
      '    # put routes for admin here',
      '  end'
    ].join("\n")
  end
end
