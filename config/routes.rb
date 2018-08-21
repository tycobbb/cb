# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root to: "home#show"

    namespace :game do
      resources :cards, only: [
        :index,
        :new,
        :create
      ]
    end
  end
end
