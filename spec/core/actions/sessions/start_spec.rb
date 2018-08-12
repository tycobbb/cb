# frozen_string_literal: true
require 'support/rails/helper'

describe Session::Start do
  subject do
    described_class.new(games: games, sessions: sessions)
  end

  # mocks
  let(:games) do
    Game::MockRepo.new
  end

  let(:sessions) do
    Session::MockRepo.new
  end

  # spec
  it 'creates and starts a session of the current game' do
    game = games.create
    actual = subject.call
    expect(actual).to be_started
    expect(actual.game).to eq(game)
  end
end
