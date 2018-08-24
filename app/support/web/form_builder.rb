# frozen_string_literal: true
module Web
  class FormBuilder < ActionView::Helpers::FormBuilder
    FORM_PARTIALS_PATH = "web/partials/forms"
    FORM_PARTIALS_FIELD = "#{FORM_PARTIALS_PATH}/field"

    # Renders the wrapper for a field with the given name
    #
    # @param name [Symbol] The name of the field
    # @yield [klass] Gives the field class name to the block
    # @yieldparam [Symbol] The field class name
    def field(name, &block)
      locals = {
        f: self,
        name: name
      }

      @template.render(
        layout: FORM_PARTIALS_FIELD,
        locals: locals,
        &block
      )
    end
  end
end
