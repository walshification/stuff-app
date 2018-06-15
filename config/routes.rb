Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stuffs#index'

  get '/stuffs/:id/favorite', to: 'stuffs#favorite'
  get '/stuffs/:id/unfavorite', to: 'stuffs#unfavorite'

  resources :stuffs
end
