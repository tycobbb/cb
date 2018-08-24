# frozen_string_literal: true
module Web
  module FormTagHelpers
    def field_image_preview(attachment)
      image_tag(
        attachment.attached? ? attachment : "",
        class: "Field-imagePreview"
      )
    end
  end
end
