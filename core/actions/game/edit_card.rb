# frozen_string_literal: true
class Game
  class EditCard
    include StaticProxy
    private_reader :games

    def initialize(games = Game::Repo.new)
      @games = games
    end

    def call(card_id, params)
      game = games.current
      card = game.edit_card(card_id, params)
      card.save
      card
    end
  end
end
