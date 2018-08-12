# frozen_string_literal: true
class Game
  class Repo
    # queries
    def current
      Game.first
    end

    # factory
    def create
      Game.create
    end
  end
end
