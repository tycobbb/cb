# frozen_string_literal: true
class Service
  include Callable

  def call
    raise NotImplementedError
  end
end
