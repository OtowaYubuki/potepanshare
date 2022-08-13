Rails.application.routes.draw do
  root to:'users#index'
  get 'reservations/new'
  resources :rooms do
    collection do
      get 'search', to:'rooms#search'
      get 'search', to:'rooms#freesearch'
    end
  end
  get 'rooms/new', to:'rooms#create'
  get 'users/show'=> "users#show"
  devise_for :users, controllers: { registrations: 'users/registrations' } 
  resources :reservations
end

