# frozen_string_literal: true
require 'support/rails/helper'

describe Game::Repo do
  subject do
    described_class.new
  end

  it 'finds the current game' do
    game = Game.create
    expect(subject.current).to eq(game)
  end

  it 'creates a new game' do
    expect { subject.create }.to change(Game, :count).by(1)
  end
end
