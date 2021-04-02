Rails.application.routes.draw do
  get 'products/index'
  get 'products/new'
  get 'products/edit'
  get 'stores/index'
  get 'stores/new'
  get 'orders/index'
  get 'orders/new'
  resources :stores
  resources :products
  resources :carts
  resources :orders
  devise_for :users, controllers: { sessions: 'users/sessions' }
	root to: "stores#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
