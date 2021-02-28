Rails.application.routes.draw do
  root to: 'home#index'
  resources :users do
    get 'simulations', to: 'users#simulations'
  end
  resources :simulations
  resources :clients do
    member do
      post 'simulations', to: 'clients#assign_simulations'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
