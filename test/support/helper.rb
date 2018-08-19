# frozen_string_literal: true
require 'pry'
require 'minitest/spec'
require 'minitest/autorun'

abort('rails is not running in the test environment!') unless Rails.env.test?

ActiveRecord::Migration.maintain_test_schema!

# run support files
Dir['test/support/**/*.rb'].each do |file|
  require file.gsub('test/', '')
end
