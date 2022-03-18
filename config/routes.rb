Rails.application.routes.draw do
  get 'reactions/index'
  get 'reactions/create'
  get 'reactions/destroy'
  get 'reactions/index'
  get 'reactions/create'
  get 'reactions/update'
  get 'reactions/destroy'
  get 'post_tags/show'
  get 'post_tags/update'
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :profiles, only: %i[index update]
  resources :posts, only: %i[index show update create destroy] do
    resources :comments, only: %i[index update create destroy]
  end
  resources :tags, only: %i[index create]
  resources :reactions, only: %i[create destroy]
end
