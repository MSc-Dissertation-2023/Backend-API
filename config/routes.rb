Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "request_guest_token", to
  resources :guest_tokens
  resources :leaderboards
  resources :stage_one_stats
  resources :stage_two_stats, only: [:index, :create]
  resources :stage_two_dda, only: [:index, :create]
  resources :stage_two_enemy_metrics, only: [:index, :create]
  # Defines the root path route ("/")
  # root "articles#index"
end
