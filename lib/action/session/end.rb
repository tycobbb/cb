# frozen_string_literal: true
class Session
  class End < ::Action
    iattr :sessions, private: true

    def initialize(sessions = Session::Repo.new)
      @sessions = sessions
    end

    def call
      session = sessions.current
      session.end
      session.save
      session
    end
  end
end
