# frozen_string_literal: true
class Game
  class Card < Entity
    # text
    validates :name, presence: true
    validates :text, presence: true

    # images
    has_one_attached :image
  end
end
