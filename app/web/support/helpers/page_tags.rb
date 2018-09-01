# frozen_string_literal: true
module Helpers
  module PageTags
    PARTIALS_PATH = "layouts/partials"

    def page_header_tag
      render(PageTags.partial(:page_header))
    end

    def page_flash_tag
      render(PageTags.partial(:page_flash))
    end

    # helpers
    def self.partial(name)
      "#{PARTIALS_PATH}/#{name}"
    end
  end
end
