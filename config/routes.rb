Rails.application.routes.draw do
  resources :answers
  resources :questions, :has_many => :answers
  resources :options
  resources :words
  resources :categories
  resources :users
  resources :session
  resources :assessments
  resources :questions do
    resources :options
  end
  get 'written' => 'assessments#written', :as => 'assessment/written_test'

  root :to => "home#index"

  get "signup" => "users#new"

  get "home" => "home#index"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  get "categories/:id/words" => "categories#get_words"

  post "word/add_learned_word" => "words#add_learned_word"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
