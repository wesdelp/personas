# frozen_string_literal: true

module Railties
  class FindPersonaFiles < Rails::Railtie
    config.before_configuration do
      Dir[Rails.root.join('app', 'models', 'personas', '*.rb')].each { |file| require file }
    end
  end
end
