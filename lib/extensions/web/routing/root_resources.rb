module Extensions
  module Web
    module Routing
      module RootResources
        def root_resources(name, *args, **kwargs, &block)
          kwargs[:module] = name
          kwargs[:controller] = :root
          resources(name, *args, **kwargs, &block)
        end
      end
    end
  end
end

ActionDispatch::Routing::Mapper.include(Extensions::Web::Routing::RootResources)
