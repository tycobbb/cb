# frozen_string_literal: true
module Web
  class FormBuilder < ActionView::Helpers::FormBuilder
    # config
    FORM_PARTIALS_PATH = "web/partials/forms"

    # Renders the wrapper for a field with the given name
    #
    # @param name [Symbol] The name of the field
    # @param options [Hash] Options to pass to the field
    # @yield [klass] Gives the field class name to the block
    # @yieldparam [Symbol] The field class name
    def field(name, options = {}, &block)
      @template.render(
        layout: partial(:field),
        locals: locals(
          name: name,
          options: options
        ),
        &block
      )
    end

    # Renders an image field and preview inside of the field wrapper. Include
    # the `ImageField` js controller on the page to get preview functionality.
    #
    # @param name [Symbol] The name of the field
    # @param attachment [ActiveStorage::Attachment] The image attachment or nil
    def image_field(name, attachment)
      @template.render(
        partial: partial(:image_field),
        locals: locals(
          name: name,
          attachment: attachment
        )
      )
    end

    # helpers
    private def partial(name)
      "#{FORM_PARTIALS_PATH}/#{name}"
    end

    private def locals(result = {})
      result[:f] = self
      result
    end
  end
end
