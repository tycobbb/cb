# frozen_string_literal: true
module Extensions
  module Web
    module Routing
      module RootResources
        # Defines the root resource of a group of resources. Maps its routes
        # to the root's scoped directory. The root configures an enclosing module
        # matching `name`, and maps actions to a root controller.
        #
        # For example, contrasting with `resources`, `root_resources :posts` would
        # map to actions on `Posts::RootController`. Nested resources will also map
        # to this module.
        #
        # @param name [Symbol] The resource name
        def root_resources(name, *args, **options, &block)
          options[:module] = name
          options[:controller] = ::Web::Controller::ROOT_NAME
          resources(name, *args, **options, &block)
        end
      end
    end
  end
end

ActionDispatch::Routing::Mapper.include(Extensions::Web::Routing::RootResources)
