Rails.application.routes.draw do
  devise_for :users

  resources :posts, except: %i[new edit]
end
