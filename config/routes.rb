Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :profiles, only: %i[show]
  resource :profile, only: %i[show update destroy]

  resources :posts, only: %i[index show update create destroy] do
    resources :comments, only: %i[index update create destroy]
    resources :post_reactions, only: %i[create]
    resource :post_reactions, only: %i[destroy]
  end
  resources :tags, only: %i[index create]
  resources :reactions, only: %i[index]
  resources :searches, only: %i[index]
  resources :auth, only: %i[index]
  resources :favorite_posts, only: %i[create destroy]
end
