# frozen_string_literal: true
class Session
  class Repo < ::Repo
    iattr :games, private: true

    def initialize(games = ::Game::Repo.new)
      @games = games
    end

    # current
    def current
      current_sessions.first
    end

    def current!
      current_sessions.first!
    end

    # lookups
    def find_by_id!(id)
      current_sessions.find_by!(id: id)
    end

    # helpers
    private def current_sessions
      games.current.sessions.started
    end

    # factory
    def create(game:)
      session = Session.new(game: game)
      session.start
      session.save
      session
    end
  end
end
