Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  get "/users/:id/fridge", to: "users#fridge"
  get "/users/:id/pets", to: "users#pets"
  post "/users/:id/fridge", to: "fridges#create"
  post "/users/:id/fridge/foods", to: "foods#create"
  delete "/pets/:id/eat", to: "foods#destroy"
  resources :pets
  resources :foods, only: [:index, :show]
  resources :fridges, only: [:index, :show]

end
