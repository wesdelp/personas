# frozen_string_literal: true

module Personas
  class RoutablePersonas
    UnroutablePersona = Class.new(StandardError)

    def self.find(persona)
      raise_unroutable_persona_error(persona) unless routable_personas.key?("personas::#{persona}")

      routable_personas["personas::#{persona}"]
    end

    def self.routable?(persona)
      routable_personas.key?("personas::#{persona}")
    end

    def self.routable_personas
      Personas::Fetcher.routable_personas
    end

    def self.raise_unroutable_persona_error(persona)
      raise UnroutablePersona, "Unable to find routable persona for #{persona}"
    end
  end
end
