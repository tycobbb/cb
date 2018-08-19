# frozen_string_literal: true
require 'support/helper'

describe Session::Start do
  it 'creates and starts a session of the current game' do
    games = Game::MockRepo.new
    game = games.create
    subject = Session::Start.new(games, Session::MockRepo.new)

    actual = subject.call
    _(actual).must_be(:started?)
    _(actual.game).must_equal(game)
  end
end
