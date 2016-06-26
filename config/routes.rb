Rails.application.routes.draw do
    get "/users/search" => "users#search"
    resources :users
    resources :user_interests


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
