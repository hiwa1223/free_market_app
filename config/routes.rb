Rails.application.routes.draw do
  devise_for :users
  root "product_buy#index"
  resources :products, only: :index
end
