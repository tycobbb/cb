# frozen_string_literal: true
module Web
  class Controller < ActionController::Base
    # helpers
    helper Web::Helper

    # rendering
    layout "page"

    # - view paths
    prepend_view_path "app/web"
    prepend_view_path "app/web/views"

    # Scopes the view lookup path to the corresponding module directory.
    #
    # Allows views to live in a directory underneath their root module, e.g.:
    # ```
    # games       -> /web/game/views/*
    # games/cards -> /web/games/views/cards/*
    # ```
    def self.local_prefixes
      prefix = controller_path
      prefix = prefix.split("/").insert(1, "views").join("/")
      [prefix]
    end
  end
end
