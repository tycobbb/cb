# frozen_string_literal: true
module Web
  class FormBuilder < ActionView::Helpers::FormBuilder
    extend FormFieldWrapping

    wrap_field :text_field
    wrap_field :file_field
  end
end
