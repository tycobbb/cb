# frozen_string_literal: true
class Session
  class Start
    private_reader :games, :sessions

    def initialize(
      games = Game::Repo.new,
      sessions = Session::Repo.new
    )
      @games    = games
      @sessions = sessions
    end

    def call
      sessions.create(
        game: games.current
      )
    end
  end
end
