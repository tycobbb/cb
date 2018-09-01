# frozen_string_literal: true
module Games
  module CardsTags
    PARTIALS_PATH = "games/views/cards/partials"

    def card_tag(card, is_link: false)
      render(partial: CardsTags.partial(:card), locals: {
        card:    card,
        is_link: is_link,
      })
    end

    def card_image_tag(card)
      render(partial: CardsTags.partial(:card_image), locals: {
        card: card,
      })
    end

    def card_form_tag(card)
      render(partial: CardsTags.partial(:card_form), locals: {
        card: card,
      })
    end

    # helpers
    def self.partial(name)
      "#{PARTIALS_PATH}/#{name}"
    end
  end
end
