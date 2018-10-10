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

    # immediately require extensions
    LoadPaths.new(config.root)
      .glob("lib", "ext", "**", "*.rb")
      .require

    # add load paths in layer-order
    config.eager_load_paths += LoadPaths.new(config.root)
      .lib("support")
      .lib("service")
      .lib("games")
      .lib("domain")
      .lib("action")
      .app("web", "support")
      .take
  end
end
