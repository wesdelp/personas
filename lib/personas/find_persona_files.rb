# frozen_string_literal: true

require 'pry-byebug'

module Personas
  class FindPersonaFiles < Rails::Railtie
    config.before_configuration do
      Dir[Rails.root.join('app', 'models', 'persona', '*.rb')].each { |file| require file }
    end
  end
end
