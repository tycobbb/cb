# frozen_string_literal: true
module Sessions
  class RootEvent
    def initialize(type, session, payload)
      @type    = type
      @session = session
      @payload = payload
    end

    def broadcast
      RootChannel.broadcast_to(@session, {
        type:    @type,
        payload: @payload
      })
    end

    # factories
    def self.sync_state(session)
      RootEvent.new(:"sync-state", session, {
        state: JSON.parse(session.turn_state)
      })
    end
  end
end
