Rails.application.routes.draw do
  root to: 'home#index'
  resources :users, only: [:index, :show] do
    get 'simulations', to: 'users#simulations'
  end
  resources :simulations, only: [:index, :show]
  resources :clients, only: [:index, :show] do
    member do
      post 'simulations', to: 'clients#assign_simulations'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
