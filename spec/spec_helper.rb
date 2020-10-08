require 'capybara/rspec'
require 'site_prism'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include Capybara::DSL

  Capybara.run_server = false
  Capybara.app_host = "http://www.knotch-cdn.com"
  Capybara.default_driver = :selenium_chrome
  Capybara.default_max_wait_time = 8
  Capybara.page.current_window.resize_to(1024, 768)

  config.warnings = true
  config.default_formatter = "doc"
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end
