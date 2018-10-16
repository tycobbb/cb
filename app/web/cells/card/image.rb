# frozen_string_literal: true
module Cells
  class Card
    class Image < ::Web::CellS
      def initialize(card)
        @card = card
        super()
      end

      def caption
        "#{@card.name} Background"
      end
    end
  end
end
