# frozen_string_literal: true

module Personas
  module Generators
    class CreateGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __dir__)
      argument :name, required: true,
                      desc: "The name of the persona to create, e.g. 'developer'"

      desc 'Generates new persona model, inheritating from base persona'

      def create_persona_model_file
        @file_name = name.underscore
        @class_name = name.titleize.gsub(/\s+/, '')
        template 'persona_model.rb', "app/models/persona/#{@file_name}.rb"
      end

      def create_persona_controller_file
        @file_name = name.underscore
        @class_name = name.titleize.gsub(/\s+/, '')
        template 'persona_controller.rb', "app/controllers/#{@file_name}/example_controller.rb"
      end

      def create_persona_view_file
        @file_name = name.underscore
        template 'persona_view.rb', "app/views/#{@file_name}/example/index.html"
      end
    end
  end
end
