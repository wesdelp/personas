# frozen_string_literal: true

# Helper methods for testing our gem's generators
#
# Rails::Generators::TestCase is rather limited and assumes the specs you are writing
# are inside the rails app you are testing. For gems though this is not the case.
#
# Instead we are generating a basic Rails app and then checking that the files we want get
# created. This is obviously slow, but is thorough enough to be worth the tradeoffs.
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
    inside_dummy_app { `bundle exec rails g personas:install -f 2>&1` }
  end

  def run_create_generator(name)
    inside_dummy_app { `bundle exec rails g personas:create #{name} -f 2>&1` }
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
      f.puts "gem 'devise'"
      f.puts "gem 'personas', path: '#{File.join(File.dirname(__FILE__), '..', '..')}'"
    end
  end

  def run_bundle
    inside_dummy_app { `bundle install --quiet` }
  end

  # `Bundler.with_clean_env` is required anywhere we invoke Rails functions to ensure
  # the gems we require come from the Gemfile inside the dummy application and not the host
  # running the specs
  def inside_dummy_app
    Bundler.with_clean_env do
      FileUtils.cd(dummy_app_path) do
        yield
      end
    end
  end
end
