Rails.application.routes.draw do

  resources :users
  resources :categories
  resources :words
  root :to => "home#index"
  
  get "signup" => "signup#index"

  get "login1" => "login#index"

  get "home" => "home#index"

  get     "login"    => "sessions#new"
  post    "login"    => "sessions#create"
  delete  "logout"   => "sessions#destroy"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
