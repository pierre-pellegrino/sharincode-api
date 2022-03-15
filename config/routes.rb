Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/profiles', to: 'profiles#show'

  resources :posts, except: %i[new edit]
end
