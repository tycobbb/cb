# frozen_string_literal: true
module Callable
  extend ActiveSupport::Concern

  class_methods do
    def call(*args, **kwargs, &block)
      if kwargs.empty?
        new(*args).call(&block)
      else
        new(*args, **kwargs).call(&block)
      end
    end
  end
end
