# frozen_string_literal: true

require 'rails/generators'

module Personas
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __dir__)

    desc 'Generates Personas initialization file and personas model directory'

    def create_initializer_file
      template 'personas.rb', 'config/initializers/personas.rb'
    end

    def create_personas_model_directory
      empty_directory 'app/models/personas'
    end
  end
end
