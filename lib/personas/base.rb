# frozen_string_literal: true

module Personas
  class Base
    class << self
      def applies?(_user)
        raise StandardError
      end

      def friendly_name
        name.downcase
      end
    end
  end
end
