# frozen_string_literal: true

module Personas
  module Rack
    class SetPersona
      def initialize(app)
        @app = app
      end

      def call(env)
        @request = ::Rack::Request.new(env)
        persona = ::Personas::Base.build_from_request(@request)
        @request.session[:persona] = persona
        # @request.session[:previous_persona] = nil #unless persona.masquerading?
        @app.call(env)
      end
    end
  end
end
