# frozen_string_literal: true
class Game
  class ShowCards
    include StaticProxy
    private_reader :games

    def initialize(games = Game::Repo.new)
      @games = games
    end

    def call
      game = games.current_with_card_images
      game&.cards || []
    end
  end
end
