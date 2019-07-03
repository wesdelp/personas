# frozen_string_literal: true

module GeneratorTestHelpers
  def create_test_app
    FileUtils.cd(tmp_path) do
      `rails new dummy --skip-active-record --skip-test-unit --skip-spring \
        --skip-bundle --skip-bootsnap --skip-listen --quiet`
      File.open(dummy_app_path + '/Gemfile', 'a') do |f|
        f.puts "gem 'personas', path: '#{File.join(File.dirname(__FILE__), '..', '..')}'"
      end
    end
    FileUtils.cd(dummy_app_path) do
      `bundle install`
    end
  end

  def remove_test_app
    FileUtils.rm_rf(dummy_app_path)
  end

  def run_install_generator
    FileUtils.cd(dummy_app_path) do
      puts `rails g personas:install -f 2>&1`
    end
  end

  def dummy_app_path
    File.join(tmp_path, 'dummy')
  end

  def tmp_path
    @tmp_path ||= File.join(File.dirname(__FILE__), '..')
  end
end
