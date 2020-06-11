Rails.application.routes.draw do
  
  resources :words
  resources :categories
  resources :users
  resources :session

  root :to => "home#index"
  
  get   "signup" => "users#new"

  get   "home" => "home#index"

  get   "login"    => "sessions#new"
  post  "login"    => "sessions#create"
  get   "logout"   => "sessions#destroy"

  get   "categories/:id/words" => "categories#get_words"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
