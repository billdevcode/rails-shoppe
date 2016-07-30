Rails.application.routes.draw do
  # get 'index/index'
  resources :categories
  resources :products
  resources :users
  resources :sessions
  resources :orders

  patch '/checkout', to: 'orders#checkout'

  get '/admin', to: 'index#admin'

  # scope 'admin', as: 'admin' do
  #   resources :categories do

  #     resources :products
  #   end
  # end

  root 'index#index'
end
