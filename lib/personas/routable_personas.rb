# frozen_string_literal: true

require_relative 'base'

module Personas
  class RoutablePersonas
    UnroutablePersona = Class.new(StandardError)

    def self.find(persona)
      raise_unroutable_persona_error(persona) unless routable_personas.key?("persona::#{persona}")

      routable_personas["persona::#{persona}"]
    end

    def self.routable?(persona)
      routable_personas.key?(persona.to_sym)
    end

    def self.routable_personas
      Personas::Base.routable_personas
    end

    def self.raise_unroutable_persona_error(persona)
      raise UnroutablePersona, "Unable to find routable persona for #{persona}"
    end
  end
end
