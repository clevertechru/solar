Rails.application.routes.draw do
  resources :videos
  namespace :admin do
    resources :users
    resources :videos
    root to: "users#index"
  end
  root to: 'videos#index'
  devise_for :users
  resources :users
  resources :videos
end
