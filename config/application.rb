# frozen_string_literal: true
require_relative "boot"
require_relative "support/load_paths"
require "rails/all"

# require the gems listed in gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CardBuilder
  class Application < Rails::Application
    config.load_defaults(5.2)

    # schema format
    config.active_record.schema_format = :sql

    # add any core directories to load paths
    config.eager_load_paths += LoadPaths.new
      .glob("app", "core", "*")
      .glob("app", "**", "support")
      .take
  end
end
