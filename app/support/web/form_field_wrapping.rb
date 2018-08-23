# frozen_string_literal: true
module Web
  module FormFieldWrapping
    WRAPPER_PATH = "web/partials/field"

    # hooks
    def wrap_field(name)
      define_method(name) do |attr, options = {}|
        locals = {
          f: self,
          attr: attr
        }

        @template.render(layout: WRAPPER_PATH, locals: locals) do |class_name|
          options[:class] ||= ""
          options[:class]  += " #{class_name}"
          super(attr, options)
        end
      end
    end
  end
end
