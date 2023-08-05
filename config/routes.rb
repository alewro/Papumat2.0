Rails.application.routes.draw do
  get 'recipe_checkings/new'
  get 'recipe_checkings/edit'
  get 'recipe_checkings/create'
  get 'recipe_checkings/update'
  get 'recipe_checkings/destroy'
  resources :meal_plans
  resources :recipe_categories
  resources :recipes
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
