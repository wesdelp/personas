# frozen_string_literal: true

require_relative 'personas/persona_router'
require_relative 'personas/persona_routing_constraint'
require_relative 'personas/routable_personas'
require_relative 'personas/base'
require_relative 'personas/other'
require_relative 'personas/shared_persona_file_system_resolver'
require_relative 'personas/rack/set_persona'
require_relative 'personas/persona_switches'
require_relative 'personas/find_persona_files' if defined? ::Rails::Railtie

module Personas
end
