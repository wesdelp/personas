# frozen_string_literal: true

module Personas
  module PersonaRouter
    # rubocop:disable Metrics/MethodLength
    def for_persona(persona_type, module_name: nil, prefix: nil, namespaced: false)
      module_name ||= persona_type

      if prefix
        namespace prefix, module: module_name do
          apply_persona_constraint(persona_type) { yield }
        end
      elsif namespaced
        namespace module_name do
          apply_persona_constraint(persona_type) { yield }
        end
      else
        scope module: module_name do
          apply_persona_constraint(persona_type) { yield }
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    private

    def apply_persona_constraint(persona_type)
      constraints PersonaRoutingConstraint.new(persona_type) do
        yield
      end
    end
  end
end
