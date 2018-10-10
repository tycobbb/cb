# frozen_string_literal: true
class Session < Entity
  # game
  belongs_to :game

  # state
  enum state: [
    :pending,
    :started,
    :ended
  ]

  def start
    self.state = :started
    add_initial_turn
  end

  def end
    self.state = :ended
  end

  # turns
  has_many :turns

  def turn_state
    turns.last.state
  end

  private def add_initial_turn
    turn = turns.build
    turn.state = game.initial_state
  end
end
