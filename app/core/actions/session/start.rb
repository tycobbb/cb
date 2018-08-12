# frozen_string_literal: true
class Session
  class Start
    def initialize(
      games:    Game::Repo.new,
      sessions: Session::Repo.new
    )
      @games    = games
      @sessions = sessions
    end

    def call
      sessions.create(game: games.current)
    end

    private

    attr_reader :games, :sessions
  end
end
