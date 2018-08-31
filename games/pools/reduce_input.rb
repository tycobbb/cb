# frozen_string_literal: true
module Pools
  class ReduceInput
    include Callable
    private_reader :state, :input

    def initialize(state, input)
      @state = state
      @input = input
    end

    def call
      "{}"
    end
  end
end
