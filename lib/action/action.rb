# frozen_string_literal: true
class Action
  include StaticProxy

  def call
    raise NotImplementedError
  end
end
