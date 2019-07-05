# frozen_string_literal: true

module GeneratorTestHelpers
  def create_test_app
    FileUtils.cd(tmp_path) do
      generate_app
      add_gems
      run_bundle
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

  def run_create_generator(name)
    FileUtils.cd(dummy_app_path) do
      puts `rails g personas:create #{name} -f 2>&1`
    end
  end

  def dummy_app_path
    File.join(tmp_path, 'dummy')
  end

  def tmp_path
    @tmp_path ||= File.join(File.dirname(__FILE__), '..')
  end

  def generate_app
    `rails new dummy --skip-active-record --skip-test-unit --skip-spring \
        --skip-bundle --skip-bootsnap --skip-listen --quiet`
  end

  def add_gems
    File.open(dummy_app_path + '/Gemfile', 'a') do |f|
      f.puts "gem 'faraday'"
      f.puts "gem 'devise'"
      f.puts "gem 'personas', path: '#{File.join(File.dirname(__FILE__), '..', '..')}'"
    end
  end

  def run_bundle
    Bundler.with_clean_env do
      FileUtils.cd(dummy_app_path) do
        `bundle install`
      end
    end
  end
end
