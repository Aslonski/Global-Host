Rails.application.routes.draw do
    resources :users
    resources :sessions, only: [:new, :create, :destroy]

  resources :conversations do
    resources :messages
  end

end
