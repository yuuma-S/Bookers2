Rails.application.routes.draw do

  resources :favorites, only: [:create, :destroy]
  root to: 'home#top'
  get 'home/top'
  get 'home/about'
  devise_for :users
  resources :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
