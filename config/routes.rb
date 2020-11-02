Rails.application.routes.draw do
  devise_for :users
  # get 'ideas/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "ideas#index"

  resources :users, only: :show
end
