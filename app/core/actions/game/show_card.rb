# frozen_string_literal: true
class Game
  class ShowCards
    include StaticProxy
    private_reader :games

    def initialize(games = Game::Repo.new)
      @games = games
    end

    def call
      game = games.current
      game&.cards || []
    end
  end
end
