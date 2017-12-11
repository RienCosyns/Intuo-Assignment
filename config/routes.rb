Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  get "/users/:id/fridge", to: "users#fridge"
  get "/users/:id/pets", to: "users#pets"
  resources :pets
  resources :fridges
  resources :foods

end
