Rails.application.routes.draw do

  root 'movies#index'

  get '/movies' => 'movies#index'
  get '/movies/:id' => 'movies#show'
  get '/directors' => 'directors#index'
  get '/directors/:id' => 'directors#show'
  get '/actors' => 'actors#index'
  get '/actors/:id' => 'actors#show'
  
end
