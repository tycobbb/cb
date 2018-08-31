# frozen_string_literal: true
class Game
  class CardsController < ApplicationController
    def index
      @cards = ShowCards.call
    end

    def new
      @card = Card.new
    end

    def create
      @card = AddCard.call(card_params)

      if @card.errors.blank?
        flash[:wrapper] = ::Web::Flash.notice("Added card.")
        redirect_to(game_cards_path)
      else
        @errors = @card.errors.messages
        render :new
      end
    end

    def show
      @card = ShowCard.call(card_id)
    end

    def edit
      @card = ShowCard.call(card_id)
    end

    def update
      @card = EditCard.call(card_id, card_params)

      if @card.errors.blank?
        flash[:wrapper] = ::Web::Flash.notice("Updated card.")
        redirect_to(game_card_path(@card))
      else
        @errors = @card.errors.messages
        render :edit
      end
    end

    def destroy
      card = RemoveCard.call(card_id)

      if card.errors.blank?
        flash[:wrapper] = ::Web::Flash.notice("Removed card.")
        redirect_to(game_cards_path)
      end
    end

    # helpers
    private def card_id
      params[:id]
    end

    private def card_params
      params.require(:game_card).permit(
        :name,
        :text,
        :image
      )
    end
  end
end
