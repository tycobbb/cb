# frozen_string_literal: true
class Flash
  module State
    NOTICE = :notice
    ALERT  = :alert
  end

  attr_reader :state, :messages

  private def initialize(state, messages)
    @state = state
    @messages = messages
  end

  # predicates
  def alert?
    state == State::ALERT
  end

  # factories
  def self.notice(message)
    Flash.new(State::NOTICE, [message])
  end

  def self.alert(errors)
    Flash.new(State::ALERT, errors.full_messages)
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
