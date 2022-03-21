Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :profiles, only: %i[index show update]
  resources :posts, only: %i[index show update create destroy] do
    resources :comments, only: %i[index update create destroy]
  end
  resources :tags, only: %i[index create]
  resources :reactions, only: %i[create destroy]
  resources :searches, only: %i[index]
end