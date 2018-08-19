# frozen_string_literal: true
require "support/helper"

describe Session::Repo do
  describe "#current" do
    it "finds the current session" do
      subject = Session::Repo.new
      _(subject.current).must_be(sessions(:current))
    end
  end

  describe "#create" do
    it "creates a new session with an initial turn" do
      subject = Session::Repo.new

      session_count = Session.count
      session_turn_count = Session::Turn.count
      session = subject.create(game: Game.create)

      _(Session.count).must_equal(session_count + 1)
      _(Session::Turn.count).must_equal(session_turn_count + 1)
      _(session.turns.count).must_equal(1)
    end
  end
end
