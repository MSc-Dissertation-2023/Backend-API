Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "request_guest_token", to
  resources :guest_tokens
  # Defines the root path route ("/")
  # root "articles#index"
end
