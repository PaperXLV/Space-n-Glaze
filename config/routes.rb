Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  resources :carts
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  get 'shop', to: 'pages#shop'
end
