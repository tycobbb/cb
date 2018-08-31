# frozen_string_literal: true
module Helpers
  module ImageTags
    def image_attachment_tag(attachment, options={})
      image_tag(
        attachment.attached? ? attachment : "",
        options
      )
    end
  end
end
