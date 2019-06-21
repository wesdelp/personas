# frozen_string_literal: true

module Personas
  class Other < Personas::Base
    def self.applies?(_user)
      true
    end
  end
end
