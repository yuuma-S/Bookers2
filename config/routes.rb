Rails.application.routes.draw do

  root to: 'home#top'
  get 'home/top'
  get 'home/about'
  devise_for :users
  resources :users

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  	resources :favorites, only: [:create, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
