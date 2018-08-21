# frozen_string_literal: true
class Game
  class AddCard
    def initialize(games = Game::Repo.new)
      @games = games
    end

    def call(params)
      game = games.current
      game.add_card(params)
      game.save!
    end

    private

    attr_reader :games
  end
end
