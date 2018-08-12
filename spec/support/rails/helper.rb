# frozen_string_literal: true
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../../config/environment', __dir__)

# prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'support/base/helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

# configure rspec
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.filter_rails_from_backtrace!
  config.infer_spec_type_from_file_location!
end

# run support files
Dir['spec/support/rails/**/*.rb'].each do |file|
  require file.gsub('spec/', '')
end
