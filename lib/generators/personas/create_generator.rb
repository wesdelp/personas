# frozen_string_literal: true

require 'rails/generators'

module Personas
  class CreateGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __dir__)
    argument :name, required: true,
                    desc: "The name of the persona to create, e.g. 'developer'"

    desc 'Generates new persona model, inheritating from base persona'

    def create_persona_model_file
      @file_name = name.underscore
      @class_name = name.titleize.gsub(/\s+/, '')
      template 'persona_model.rb', "app/models/personas/#{@file_name}.rb"
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

    def inject_route_helper
      insert_into_file 'config/routes.rb',
                       route_block,
                       after: "Rails.application.routes.draw do\n"
    end

    private

    def route_block
      <<~RUBY
        for_persona :#{name.underscore} do
          # put routes for #{name.underscore} here
        end

      RUBY
    end
  end
end
