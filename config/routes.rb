Rails.application.routes.draw do
  get 'reservations/new'
  resources :rooms
  get 'rooms/new', to:'rooms#create'
  get 'users/show'=> "users#show"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to:'users#index'
  get 'reservations/index'
  get 'reservations/new' ,to:'reservations#create'
  post 'reservations/confirm'
  post 'reservations/back'
  post 'reservations/complete'
end

