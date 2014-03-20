# Instagram code:
# enable :sessions
# CALLBACK_URL = "http://localhost:9292/oauth/callback"

Projcess::Application.routes.draw do
  
  get "home" => 'pages#home'
  post "signup" => 'pages#new_user'
  get "login" => 'pages#login'
  get "user/:id" => 'pages#profile'
  post "update/:id" => 'pages#update'
  get "add_project/:id" => 'pages#add_project'
  post "save_project/:id" => 'pages#save_project'
  get "join_project/:id" => 'pages#join_project'
  post "find_project/:id" => 'pages#find_project'
  get "add_photo/:id" => 'pages#add_photo'
  post "project/:id" => 'pages#project'
  
  
  # Refactoring
  
  resources :users, :projects, :photos
  
  get "/oauth/connect" => 'instagram#connect'
  get "/oauth/callback" => 'instagram#callback'
  

  
end
