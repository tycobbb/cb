# frozen_string_literal: true
require_relative 'boot'
require 'rails/all'

# require the gems listed in gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CardBuilder
  class Application < Rails::Application
    config.load_defaults 5.2

    config.eager_load_paths += %w[
      core
      core/domain
      core/domain/support
      core/services
    ].map { |p| config.root.join(p) }
  end
end
