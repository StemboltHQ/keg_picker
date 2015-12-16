Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :beers
  resources :ballots
  resources :polls do
    patch :finalize
  end

  namespace :api do
    resources :polls, only: [:show]
  end

  root "ballots#index"
end
