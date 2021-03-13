require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

Capybara.register_driver :selenium_remote_firefox do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: "http://#{ENV['SELENIUM_HOST'] || 'localhost' }:4444/wd/hub",
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox
  )
end

Capybara.default_driver = ENV['CI'] ? :selenium_headless : :selenium_remote_firefox

if ENV['SELENIUM_APP_HOST']
  Capybara.server_host = ENV['SELENIUM_APP_HOST']
end
