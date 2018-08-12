# frozen_string_literal: true
require 'support/rails/helper'

describe Session::Repo do
  subject do
    described_class.new
  end

  it 'finds the current session' do
    session = Session.create(game: Game.create)
    expect(subject.current).to eq(session)
  end

  it 'creates a new session with an initial turn' do
    session = nil

    expect {
      session = subject.create(game: Game.create)
    }.to pass_all(
      change(Session, :count).by(1),
      change(Session::Turn, :count).by(1)
    )

    expect(session.turns.count).to eq(1)
  end
end
