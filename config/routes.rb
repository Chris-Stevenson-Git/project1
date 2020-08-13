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


#Add User to shopping List
post '/shopping_lists/:id' => 'shopping_lists#add_user', as: 'add_user_to_shopping_list'
#add comment to recipe
post '/recipes/:id' => 'recipes#add_comment'

end
