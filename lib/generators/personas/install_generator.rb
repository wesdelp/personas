# frozen_string_literal: true

require 'pry-byebug'
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

      def inject_include_personas_router
        return unless needs_router_module?

        insert_into_file 'config/routes.rb',
                         include_router_block,
                         before: "Rails.application.routes.draw do\n"
      end

      private

      def needs_router_module?
        log = Logger.new($stderr)
        log.info(`ls`)
        File.readlines('config/routes.rb').none? do |line|
          line =~ /include #{persona_router_module}/
        end
      end

      def include_router_block
        <<~RUBY
          include #{persona_router_module}

        RUBY
      end

      def persona_router_module
        'Personas::PersonaRouter'
      end
    end
  end
end
