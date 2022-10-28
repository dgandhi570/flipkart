# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'search/index'
  resources :products do
    collection do
      post :import
      post :search
    end
  end
  root 'products#index'
end
