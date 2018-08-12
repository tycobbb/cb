# # frozen_string_literal: true
require 'game'
require_relative '../mock_repo'

class Game
  class MockRepo < ::MockRepo
    # queries
    def current
      get(0)
    end

    # factory
    def create
      build
    end

    protected

    def instance(_id, attrs)
      Game.new(attrs)
    end
  end
end
