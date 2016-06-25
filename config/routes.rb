Rails.application.routes.draw do
    resources :users
    resources :sessions, only: [:new, :create, :destroy]

  root 'welcome#index'

  resources :conversations do
    resources :messages
  end

end
