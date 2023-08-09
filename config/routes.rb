Rails.application.routes.draw do
  resources :all_products
  resources :shopping_lists
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
  post 'change_is_done', to: "recipes#change_is_done"
  post 'change_is_bought', to: "shopping_lists#change_is_bought"

  delete 'shopping_lists', to: "shopping_lists#all_delete"
  # Defines the root path route ("/")
  root "pages#set_roots"
end
