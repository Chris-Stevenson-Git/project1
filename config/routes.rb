Rails.application.routes.draw do

#root routes
root to: 'pages#welcome'
get '/home' => 'pages#home'

#session routes
get '/login' => 'session#new' #login form
post '/login' => 'session#create' #form submit and authenticate
delete '/login' => 'session#destroy' #logout

#CRUD
resources :users
resources :recipes
resources :comments


end
