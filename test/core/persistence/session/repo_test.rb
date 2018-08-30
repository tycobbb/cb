# frozen_string_literal: true
require "support/helper"

class Session::RepoTest < ActiveSupport::TestCase
  setup do
    @repo = Session::Repo.new
  end

  fixtures :all

  # -- #current
  test "finds the current session" do
    assert_equal(@repo.current, sessions(:current))
  end

  # -- #create
  test "creates a new session with an initial turn" do
    initial_count = Session.count
    initial_turn_count = Session::Turn.count

    session = @repo.create(game: games(:current))
    assert_equal(session.turns.count, 1)
    assert_equal(Session.count,       initial_count + 1)
    assert_equal(Session::Turn.count, initial_turn_count + 1)
  end
end
