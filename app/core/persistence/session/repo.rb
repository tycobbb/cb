# frozen_string_literal: true
class Session
  class Repo
    private_reader :games

    # queries
    def initialize(games = ::Game::Repo.new)
      @games = games
    end

    def current
      games.current.sessions.first
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
