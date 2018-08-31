# frozen_string_literal: true
require_relative "boot"
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
    new_load_paths = Dir.glob(
      config.root.join("core", "*")
    )

    # add any support dirs under app/core to load paths
    new_load_paths += Dir.glob(
      config.root.join("{app,core}", "**", "{support}")
    )

    config.eager_load_paths += new_load_paths.uniq
  end
end
