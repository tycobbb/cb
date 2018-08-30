# frozen_string_literal: true
require "pry"
require "rails/test_help"
require "minitest/reporters"
require "minitest/autorun"

abort("rails is not running in the test environment!") unless Rails.env.test?

# clean up output
Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)

# force migrations in tests
ActiveRecord::Migration.maintain_test_schema!

# run support files
Dir["test/support/**/*.rb"].each do |file|
  require file.gsub("test/", "")
end
