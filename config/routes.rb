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
resources :shopping_lists

#New Recipe Routes
get '/recipes/new/desc/:id' => 'recipes#add_desc', as: 'new_desc'
patch '/recipes/new/desc/:id' => 'recipes#update_desc', as: 'update_desc'
get '/recipes/new/ingredients/:id' => 'recipes#add_ingredients', as: 'new_ingredients'
patch '/recipes/new/ingredients/:id' => 'recipes#update_ingredients', as: 'update_ingredients'
get '/recipes/new/method/:id' => 'recipes#add_method', as: 'new_method'
patch '/recipes/new/method/:id' => 'recipes#update_method', as: 'update_method'
get '/recipes/new/image/:id' => 'recipes#add_image', as: 'new_image'
get '/recipes/new/ul_image/:id' => 'recipes#add_image_upload', as: 'new_ul_image'
patch '/recipes/new/image/:id' => 'recipes#update_image', as: 'update_image'


end
