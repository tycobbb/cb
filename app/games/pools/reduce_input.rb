# frozen_string_literal: true
module Pools
  class ReduceInput
    include Callable

    def initialize(state, input)
      @state = state
      @input = input
    end

    def call
      "{}"
    end

    private

    attr_reader :state, :input
  end
end
