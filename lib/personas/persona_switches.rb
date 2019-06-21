# frozen_string_literal: true

module Personas
  module PersonaSwitches
    def switch_persona(session, next_persona)
      session[:previous_persona] = session[:persona].dup
      session[:persona] = persona_name(next_persona)
    end

    def persona_name(persona)
      Personas::Base.routable_personas[persona].try(:friendly_name)
    end
  end
end
