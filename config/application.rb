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

    # load paths
    config.eager_load_paths += %w[
      app/core/support
      app/core/actions
      app/core/actions/support
      app/core/domain
      app/core/domain/support
      app/core/persistence
      app/core/persistence/support
      app/games/support
    ].map { |p| config.root.join(p) }
  end
end
