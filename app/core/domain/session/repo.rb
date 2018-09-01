# frozen_string_literal: true
class Session
  class Repo < ::Repo
    private_reader :games

    def initialize(games = ::Game::Repo.new)
      @games = games
    end

    # queries
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
