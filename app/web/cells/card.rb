# frozen_string_literal: true
module Cells
  class Card < ::Web::Cell
    iattr :card
    iattr :is_link

    def initialize(card, is_link:)
      @card    = card
      @is_link = is_link
      super()
    end
  end
end
