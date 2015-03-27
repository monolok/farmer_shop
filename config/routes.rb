Rails.application.routes.draw do

  resources :products, only: [:index]

  resource :cart, only: [:show] do 
  	get 'payment', to: "carts#payment"
	post 'payment', to: "carts#payment"
  end

  resources :order_items, only: [:create, :update, :destroy]

  root to: "products#index"

end
