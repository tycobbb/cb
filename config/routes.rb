# frozen_string_literal: true
Rails.application.routes.draw do
  scope module: :home do
    root "#show"
  end

  root_resources :games, only: [] do
    root_resources :cards
  end

  root_resources :sessions, except: [:index, :edit, :update]
end
