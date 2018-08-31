# frozen_string_literal: true
Rails.application.routes.draw do
  root to: "home#show"

  namespace :game do
    resources :cards
  end
end
