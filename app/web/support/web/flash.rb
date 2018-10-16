# frozen_string_literal: true
module Web
  class Flash
    module State
      NOTICE = :notice
      ALERT  = :alert
    end

    iattr :state
    iattr :messages

    private def initialize(state, messages)
      @state = state
      @messages = messages
    end

    # predicates
    def alert?
      state == State::ALERT
    end

    # factories
    def self.notice(*messages)
      Flash.new(State::NOTICE, messages)
    end

    def self.alert(*messages)
      Flash.new(State::ALERT, messages)
    end

    def self.deserialize(flash_or_data)
      return nil if flash_or_data.nil?
      return flash_or_data if flash_or_data.is_a?(Flash)

      Flash.new(
        flash_or_data["state"].to_sym,
        flash_or_data["messages"]
      )
    end
  end
end
