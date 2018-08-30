# frozen_string_literal: true
module Web
  module ImageTagHelpers
    def image_attachment_tag(attachment, options={})
      image_tag(
        attachment.attached? ? attachment : "",
        options
      )
    end
  end
end
