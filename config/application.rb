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

    # shorthand for the directories enum
    d = LoadPaths::Directories

    # add load p in layer-order
    config.eager_load_paths = LoadPaths.new(config.root)
      .path(d::LIB, "support")
      .path(d::LIB, "service")
      .path(d::LIB, "games")
      .path(d::LIB, "domain")
      .path(d::LIB, "action")
      .path(d::APP)
      .path(d::WEB)
      .path(d::WEB, "support")
      .take
  end
end
