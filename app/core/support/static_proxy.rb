# frozen_string_literal: true
module StaticProxy
  extend ActiveSupport::Concern

  class_methods do
    def respond_to_missing?(name, include_private = false)
      method_defined?(name) || super
    end

    def method_missing(name, *args, &block)
      if method_defined?(name)
        new.send(name, *args, &block)
      else
        super
      end
    end
  end
end
