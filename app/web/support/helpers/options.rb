# frozen_string_literal: true
module Helpers
  module Options
    def with_class!(options, new_klass)
      klass = options[:class]
      options[:class] = klass.present? ? [klass, new_klass] : new_klass
      options
    end
  end
end
