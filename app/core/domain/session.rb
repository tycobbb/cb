# frozen_string_literal: true
class Session < Entity
  # game
  belongs_to :game

  # turns
  has_many :turns

  def start
    turn = turns.build
    turn.state = game.initial_state
  end
end
