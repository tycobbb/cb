# frozen_string_literal: true
class Game
  class Card
    class Repo
      include StaticProxy
      private_reader :games

      def initialize(games = ::Game::Repo.new)
        @games = games
      end

      # queries
      def find(id)
        games.current.cards.find(id)
      end
    end
  end
end
