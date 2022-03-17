Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :profiles, only: %i[index update]
  resources :posts, except: %i[new edit]
end
