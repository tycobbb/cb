# frozen_string_literal: true
module Web
  class Controller < ApplicationController
    before_action :scope_view_lookup

    def scope_view_lookup
      scope_view_path!
      scope_view_prefix!
    end

    # Adds the web directory to the view paths to lookup views scoped by module.
    private def scope_view_path!
      lookup_context.view_paths.unshift("app/web")
    end

    # Mutates the default view resource prefix (!) to lookup views scoped by
    # module.
    #
    # Allows views to live in a directory underneath the root module, e.g.:
    # games       -> /web/game/views/*
    # games/cards -> /web/games/views/cards/*
    private def scope_view_prefix!
      prefix = lookup_context.prefixes.shift
      prefix = prefix.split("/").insert(1, "views").join("/")

      lookup_context.prefixes.unshift(prefix)
    end
  end
end
