Rails.application.routes.draw do

  root :to => "home#index"
  
  get "signup" => "signup#index"

  get "login" => "login#index"
  
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
