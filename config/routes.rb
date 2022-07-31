Rails.application.routes.draw do
  get 'users/show'=> "users#show"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get '/', to:'users#index'
end

