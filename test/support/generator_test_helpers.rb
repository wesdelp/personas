# frozen_string_literal: true

module GeneratorTestHelpers
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def test_path
      File.join(File.dirname(__FILE__), '..')
    end

    def create_generator_sample_app
      FileUtils.cd(test_path) do
        system rails_new_command
      end
    end

    def rails_new_command
      'rails new tmp --skip-active-record --skip-test-unit --skip-spring --skip-bundle --quiet'
    end

    def remove_generator_sample_app
      # FileUtils.rm_rf(destination_root)
      FileUtils.rm_rf(test_path + '/tmp')
    end
  end
end
