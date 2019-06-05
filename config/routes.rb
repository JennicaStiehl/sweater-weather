Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/photo', to: 'photos#show'
      post '/users', to:'users#create'
      get '/users', to: 'users#index'
      post '/sessions', to: 'sessions#create'
      post '/favorites', to: 'favorites#create'
      get '/favorites', to: 'favorites#index'
    end
  end
end
