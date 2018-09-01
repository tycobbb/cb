# frozen_string_literal: true
class Game
  class AddCard < ::Action
    private_reader :games

    def initialize(games = Game::Repo.new)
      @games = games
    end

    def call(params)
      game = games.current
      card = game.add_card(params)
      card.save
      card
    end
  end
end
