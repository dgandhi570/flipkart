Rails.application.routes.draw do
  resources :products do
      collection { post :import
                  post :search }
    end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end