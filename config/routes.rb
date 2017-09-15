Rails.application.routes.draw do
  root to: 'pages#home'
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  resources :carts
  resources :cards, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  get 'shop', to: 'products#index'
  get 'checkout', to: 'checkouts#checkout'
end
