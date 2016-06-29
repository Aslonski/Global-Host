Rails.application.routes.draw do
  get "/users/search" => "users#search"

  resources :users do
    resources :reviews, only: [:show, :new, :create, :index] do
      resources :interests, only: [:create_interests, :update_interests, :create_about_me, :update_about_me] do
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  root 'welcome#index'

  resources :conversations do
    resources :messages
  end

  # this needs addressing
  resources :itineraries do
    resources :activities do
      resources :locations
    end
  end

end
