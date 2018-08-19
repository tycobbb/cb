# frozen_string_literal: true
require 'session'
require_relative '../mock_repo'

class Session
  class MockRepo < ::MockRepo
    # queries
    def current
      get(0)
    end

    # factory
    def create(game:)
      session = build(game: game)
      session.start
      session
    end

    protected

    def instance(_id, attrs)
      Session.new(attrs)
    end
  end
end
