# frozen_string_literal: true
module Web
  module OptionsHelpers
    def with_class!(options, new_klass)
      klass = options[:class]

      if klass.present?
        options[:class] = [klass, new_klass]
      else
        options[:class] = new_klass
      end

      options
    end
  end
end
