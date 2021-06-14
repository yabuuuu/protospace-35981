Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  root to: "prototypes#index"

  resources :prototypes  do
   resources :comments, only: :create
  end
end

#resources :rooms, only: [:new, :create, :destroy] do
 # resources :messages, only: [:index, :create]
#end
