# frozen_string_literal: true
require "support/helper"

class Game::RepoTest < ActiveSupport::TestCase
  setup do
    @repo = Game::Repo.new
  end

  fixtures :all

  # -- #current
  test "finds the current game" do
    assert_equal(@repo.current, games(:current))
  end

  # -- #create
  test "creates new games" do
    initial_count = Game.count
    @repo.create
    assert_equal(Game.count, initial_count + 1)
  end
end
