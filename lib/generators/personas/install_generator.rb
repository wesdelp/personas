# frozen_string_literal: true

module Personas
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __dir__)

      desc 'Generates Personas initialization file and personas model directory'

      def create_initializer_file
        template 'personas.rb', 'config/initializers/personas.rb'
      end

      def create_persona_model_directory
        empty_directory 'app/models/persona'
      end
    end
  end
end
