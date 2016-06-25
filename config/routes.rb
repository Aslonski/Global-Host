Rails.application.routes.draw do

  root 'welcome#index'

  resources :conversations do
    resources :messages
  end

end
