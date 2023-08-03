Rails.application.routes.draw do
  resources :meal_plans
  resources :recipe_categories
  resources :recipes
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
