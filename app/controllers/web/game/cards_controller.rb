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
      ::Game::AddCard.new.call(card_params)
      flash[:notice] = "Added card."
      redirect_to(game_cards_path)
    end

    private

    def card_params
      params.require(:game_card).permit(
        :name,
        :text
      )
    end
  end
end
