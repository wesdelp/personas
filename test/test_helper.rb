# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'

require 'minitest/autorun'

# For generators
require 'rails/generators/test_case'
require './lib/generators/personas/install_generator'
require './lib/generators/personas/create_generator'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }