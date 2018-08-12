# frozen_string_literal: true
class Session < Entity
  # game
  belongs_to :game

  # state
  enum state: [
    :pending,
    :started,
    :finished
  ]

  def start
    self.state = :started
    add_initial_turn
  end

  # turns
  has_many :turns

  private

  def add_initial_turn
    turn = turns.build
    turn.state = game.initial_state
  end
end
