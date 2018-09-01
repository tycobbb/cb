# frozen_string_literal: true
Rails.application.routes.draw do
  scope module: :home do
    root to: "home#show"
  end

  resources :games, module: :games, only: [] do
    resources :cards
  end
end
