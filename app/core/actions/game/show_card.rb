# frozen_string_literal: true
class Game
  class ShowCard < ::Action
    iattr :games, private: true

    def initialize(games = Game::Repo.new)
      @games = games
    end

    def call(card_id)
      game = games.current_with_cards_and_images
      game&.cards&.record(card_id)
    end
  end
end
