# frozen_string_literal: true
module Web::Game
  class CardsController < ApplicationController
    def index
      @cards = ::Game::Repo.new.current.cards
    end

    def new
      @card = ::Game::Card.new
    end

    def create
      @card = ::Game::AddCard.new.call(card_params)

      if @card.errors.blank?
        flash[:wrapper] = Flash.notice("Added card.")
        redirect_to(game_cards_path)
      else
        flash.now[:wrapper] = Flash.alert(@card.errors)
        render :new
      end
    end

    private def card_params
      params.require(:game_card).permit(
        :name,
        :text
      )
    end
  end
end
