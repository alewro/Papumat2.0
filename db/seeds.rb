# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#User create
User.create(email: "test@example.com",
            password: "password",
            password_confirmation: "password")

#Recipe Categories create
RecipeCategory.create(name:"SaltyBreakfast")
RecipeCategory.create(name:"SweetBreakfast")
RecipeCategory.create(name:"Lunch")
RecipeCategory.create(name:"OneDick")

#Product Categories create
ProductCategory.create(name:"diary")
ProductCategory.create(name:"vegetables")
ProductCategory.create(name:"fruit")
ProductCategory.create(name:"bread")

#Recipes create
10.times do |x|
  Recipe.create(name: "#{x} recipe", description: "Description goes brrr for #{x} time", recipe_category_id: 1)
  Recipe.create(name: "0#{x} recipe", description: "Description goes brrr for #{x} time", recipe_category_id: 2)
  Recipe.create(name: "1#{x} recipe", description: "Description goes brrr for #{x} time", recipe_category_id: 3)
  Recipe.create(name: "2#{x} recipe", description: "Description goes brrr for #{x} time", recipe_category_id: 4)
end