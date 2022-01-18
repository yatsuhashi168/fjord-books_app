Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  resources :books
end