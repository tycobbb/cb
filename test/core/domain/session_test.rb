# frozen_string_literal: true
require "support/helper"

class SessionTest < ActiveSupport::TestCase
  # -- #start
  test "starts the session with an valid initial turn" do
    session = Session.new(game: Game.new)
    session.start
    assert_predicate(session, :started?)
    assert_equal(session.turns.length, 1)
    assert_not_nil(session.turn_state)
  end

  # -- #end
  test "ends the session" do
    session = Session.new(game: Game.new)
    session.end
    assert_predicate(session, :ended?)
  end
end
