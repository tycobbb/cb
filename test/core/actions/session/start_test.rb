# frozen_string_literal: true
require "support/helper"

class Session::StartTest < ActiveSupport::TestCase
  test "creates and starts a session of the current game" do
    games = Game::MockRepo.new
    start = Session::Start.new(games, Session::MockRepo.new)

    game    = games.create
    session = start.call
    assert_predicate(session, :started?)
    assert_equal(session.game, game)
  end
end
