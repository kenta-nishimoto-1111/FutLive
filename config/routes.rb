Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root to: "posts#index"
  resources :posts, only: [:index, :new, :create,] do
    resources :messages, only: [:index, :create]
  end
end
