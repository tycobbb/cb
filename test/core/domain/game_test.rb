# frozen_string_literal: true
require "support/helper"

class GameTest < ActiveSupport::TestCase
  # -- #initial_state
  test "produces the game's initial state" do
    game = Game.new
    assert_not_nil(game.initial_state)
  end
end
