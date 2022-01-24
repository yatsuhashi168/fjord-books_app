Rails.application.routes.draw do
  get 'followers/index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    resources :followings, only: :index
  end
  namespace :users do
    resources :follow_relationships, only: %i(create destroy)
  end
end
