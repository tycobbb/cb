# frozen_string_literal: true
require 'pry'

# base spec configuration
RSpec.configure do |config|
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.example_status_persistence_file_path = 'spec/run.log'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

# run support files
Dir['spec/support/base/**/*.rb'].each do |file|
  require file.gsub('spec/', '')
end
