# frozen_string_literal: true
module Cells
  class Card
    class Form < ::Web::Cell
      # include ActionView::RecordIdentifier
      # include ActionView::Helpers::FormHelper
      # include ActionView::Helpers::TextHelper
      # include ActionView::Context
      # include ActionView::RoutingUrlFor
      # def _routes
      #   binding.pry
      #   @controller._routes if @controller.respond_to?(:_routes)
      # end
      # include ActionView::RecordIdentifier
      # include ActionView::Helpers::UrlHelper
      # include ActionView::Helpers::FormHelper
      # include ActionDispatch::Routing::PolymorphicRoutes

      # properties
      iattr :card

      def initialize(card)
        @card = card
      end
    end
  end
end
