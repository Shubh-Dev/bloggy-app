 

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'spec_helper'
require 'capybara/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
begin
  ActiveRecord::Migration.maintain_test_schema!
   rescue ActiveRecord::PendingMigrationError => e
   puts e.to_s.strip
   exit 1
   end
RSpec.configure do |config|

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome
