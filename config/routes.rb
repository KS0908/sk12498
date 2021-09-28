Rails.application.routes.draw do
  get  "signup" => "users#new"
  get  'posts/index' 
  get  "users/index" => "users#index"
  get "users/login_form" => "users#login_form"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout"  => "users#logout"
  post "logout" => "users#logout"
  get  'home/top'
  get  'home/about'
  get  "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  post "users/create" => "users#create"
  get  "users/:id" => "users#show"
  get  "posts/:id" => "posts#show"
  get  "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get  "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
