Rails.application.routes.draw do
  resources :rooms
  get 'rooms/new', to:'rooms#create'
  get 'users/show'=> "users#show"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to:'users#index'
end

