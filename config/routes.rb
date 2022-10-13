# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search/index'
  get 'search/boom'
  resources :products do
    collection do
      post :import
      post :search
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/searchpage"
  # Defines the root path route ("/")
  root 'products#index'
end
