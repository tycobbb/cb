# frozen_string_literal: true
class Game < Entity
  # sessions
  has_many :sessions

  # setup
  def initial_state
    setup.call
  end

  private def setup
    Pools::Setup
  end

  # cards
  has_many :cards

  def add_card(params)
    cards.build(params)
  end

  def edit_card(card_id, params)
    card = cards.record(card_id)
    card.assign_attributes(params)
    card
  end

  def remove_card(card_id)
    cards.remove_record(card_id)
  end
end
