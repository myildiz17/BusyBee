Rails.application.routes.draw do
  # get 'sessions/login'
  post '/sessions/login_attempt'
  # get 'sessions/logout'

  get "signup", to:"sessions#new", as: "signup"
  get "login", to: "sessions#login", as: "login"
  get "login_attempt", to:"sessions#login_attempt", as:"login_attempt"
  get "sessions", to: "sessions#new", as: "sessions"
  get "home", to: "sessions#home", as: "home"
  
  post 'sessions/home'
  # get 'sessions/neighbors/new'
  # get 'sessions/profile'
  # root :to => "sessions#home"
  # post "signup", :to => "sessions#new"
  # post "login", :to => "sessions#login"
  # post "logout", :to => "sessions#logout"
  # post "home", :to => "sessions#home"
  # post "profile", :to => "sessions#profile"
  # post "setting", :to => "sessions#setting"
  
  resources :neighbors
  resources :worker_bees
  resources :jobs
  resources :dogs 
  resources :children
  resources :skills

patch '/schedule', to: 'schedule#update', as: 'add_to_schedule'
end
