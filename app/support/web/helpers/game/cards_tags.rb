# frozen_string_literal: true
module Web
  module Helpers
    module Game
      module CardsTags
        COMPONENT_PARTIALS_PATH = "web/game/cards/partials"

        def card_tag(card, is_link: false)
          render(partial: partial(:card), locals: {
            card:    card,
            is_link: is_link,
          })
        end

        def card_image_tag(card)
          render(partial: partial(:card_image), locals: {
            card: card,
          })
        end

        def card_form_tag(card)
          render(partial: partial(:card_form), locals: {
            card: card,
          })
        end

        # helpers
        private def partial(name)
          "#{COMPONENT_PARTIALS_PATH}/#{name}"
        end
      end
    end
  end
end
