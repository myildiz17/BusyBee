Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


resources :worker_bees
resources :jobs

resources :children
resources :skills
# resources :neighbors do
#   resources :children, :dogs
# end
resources :neighbors do
  resources :dogs
  resources :children
end

end

