Rails.application.routes.draw do
  get 'reservations/new'
  resources :rooms
  get 'rooms/new', to:'rooms#create'
  get 'users/show'=> "users#show"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to:'users#index'
  get 'reservations/index'
  post 'reservations/index'
  post 'reservations/new', to:'reservations#create'
  get 'reservations/confirm' # 確認画面
end

