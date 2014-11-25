ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require "codeclimate-test-reporter"
require 'shoulda-matchers'
require 'factory_girl_rails'
require 'rspec/rails'
# require 'rspec/autorun'
require 'capybara/rspec'
require 'database_cleaner'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # codeclimate
  if ENV['CODECLIMATE_REPO_TOKEN']
    require 'codeclimate-test-reporter'
    CodeClimate::TestReporter.start
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # factorygirl
  config.before do
    FactoryGirl.reload
  end

  # capybara
  config.include Capybara::DSL
  #
  config.before(:all) do
    Capybara.default_selector = :css
    Capybara.javascript_driver = :webkit
  end
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  #
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

