# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Personas::InstallGenerator, type: :generator do
  it 'creates an personas initializer file' do
    expect(File).to exist("#{dummy_app_path}/config/initializers/personas.rb")
  end

  it 'creates an app/models/personas directory' do
    expect(File).to be_directory("#{dummy_app_path}/app/models/personas")
  end
end
