# frozen_string_literal: true
require 'support/helper'

describe Game::Repo do
  describe '#current' do
    it 'finds the current game' do
      subject = Game::Repo.new
      game = Game.create
      _(subject.current).must_equal(game)
    end
  end

  describe '#create' do
    it 'creates a new game' do
      subject = Game::Repo.new
      game_count = Game.count
      subject.create
      _(Game.count).must_equal(game_count + 1)
    end
  end
end
