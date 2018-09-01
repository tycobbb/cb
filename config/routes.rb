# frozen_string_literal: true
Rails.application.routes.draw do
  root "root#show", module: :home

  root_resources :games, only: [] do
    resources :cards
  end

  root_resources :sessions, only: [:new, :create]
end
