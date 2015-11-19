Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :beers
  resources :ballots
  resources :polls, only: [:create]

  root "beers#index"
end
