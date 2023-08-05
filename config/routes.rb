Rails.application.routes.draw do
  resources :recipe_dones
  resources :meal_plans
  resources :recipe_categories
  resources :recipes
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post "recipes/:id", to: "recipes#update_recipe_done"
  root "pages#index"
end
