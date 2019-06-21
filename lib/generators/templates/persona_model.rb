# frozen_string_literal: true

module Persona
  class <%= @class_name %> < Personas::Base
    def self.applies?(user)
      # Implement logic here to determine if this persona matches the current user
      # user.<%= @file_name %>?
    end
  end
end
