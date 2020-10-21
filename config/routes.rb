Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

resources :neighbors
resources :worker_bees
resources :jobs
resources :dogs
resources :children
resources :skills

end

