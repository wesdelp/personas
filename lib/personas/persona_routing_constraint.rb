# frozen_string_literal: true

module Personas
  class PersonaRoutingConstraint
    def initialize(persona_type)
      @persona_type = RoutablePersonas.find(persona_type.to_s)
    end

    def matches?(request)
      return false unless request.session[:persona]

      request.session[:persona] == @persona_type.friendly_name
    end
  end
end
