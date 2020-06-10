Rails.application.routes.draw do

  resources :users
  root :to => "home#index"
  
  get "signup" => "users#new"

  get "home" => "home#index"

  get     "login"    => "sessions#new"
  post    "login"    => "sessions#create"
  delete  "logout"   => "sessions#destroy"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
