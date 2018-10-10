# frozen_string_literal: true
module Web
  class Controller < ActionController::Base
    ROOT_NAME = "root"

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
    # games       -> /web/games/views/*
    # games/cards -> /web/games/views/cards/*
    # ```
    def self.local_prefixes
      path_components = controller_path.split("/").push("views")
      path = path_components.join("/")
      [path]
    end
  end
end
