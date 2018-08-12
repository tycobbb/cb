# frozen_string_literal: true
module Callable
  extend ActiveSupport::Concern

  class_methods do
    def call(*args, **kwargs)
      if kwargs.count != 0
        new(*args, **kwargs).call
      else
        new(*args).call
      end
    end
  end
end
