Rails.application.routes.draw do

  root to: 'home#top'
  get 'home/top'
  get 'home/about'
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
  end

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  	resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
