# frozen_string_literal: true
class Game
  class Repo < ::Repo
    # queries
    def current
      Game.first
    end

    def current_with_cards_and_images
      Game.includes(cards: { image_attachment: :blob }).first
    end

    # factory
    def create
      Game.create
    end
  end
end
