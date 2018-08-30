# frozen_string_literal: true
require "support/helper"

class Game::Card::RepoTest < ActiveSupport::TestCase
  setup do
    @repo = Game::Card::Repo.new
  end

  fixtures :all

  # -- #find
  test "finds the card on the current game" do
    card = game_cards(:first)
    assert_equal(@repo.find(card.id), card)
  end
end
