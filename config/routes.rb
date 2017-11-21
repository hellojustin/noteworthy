Rails.application.routes.draw do

  defaults format: :json do
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    root to: 'home#index'

    resources :notes, only: [:index]
  end
  
end
