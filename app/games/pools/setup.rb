# frozen_string_literal: true
module Pools
  class Setup
    include Callable

    def initialize(game)
      @game = game
    end

    def call
      "{}"
    end

    private

    attr_reader :game
  end
end
