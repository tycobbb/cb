# frozen_string_literal: true
module Pools
  class ReduceInput < ::Service
    iattr :state, :input, private: true

    def initialize(state, input)
      @state = state
      @input = input
    end

    def call
      "{}"
    end
  end
end
