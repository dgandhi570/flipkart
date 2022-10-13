Rails.application.routes.draw do
  get 'search/index'
  get 'search/primary'
  resources :products do
      collection { post :import
                  post :search }
    end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    # get "/searchpage"
  # Defines the root path route ("/")
  root "products#index"
end