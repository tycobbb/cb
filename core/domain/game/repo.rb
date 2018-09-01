# frozen_string_literal: true
class Game
  class Repo
    include StaticProxy

    # queries
    def current
      Game.first
    end

    def current_with_card_images
      Game.first
    end

    # factory
    def create
      Game.create
    end
  end
end
