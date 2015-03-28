Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products, only: [:index, :show]

  resource :cart, only: [:show] do 
  	get 'payment', to: "carts#payment"
	post 'payment', to: "carts#payment"
  end

  resources :order_items, only: [:create, :update, :destroy]

  root to: "products#index"

end
