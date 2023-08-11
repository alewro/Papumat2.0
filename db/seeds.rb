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
RecipeCategory.create(name:"Salty Breakfast")
RecipeCategory.create(name:"Adult Breakfast")
RecipeCategory.create(name:"Sweet Breakfast")
RecipeCategory.create(name:"Midday Meal")
RecipeCategory.create(name:"Children Evening Meal")
RecipeCategory.create(name:"Adult Evening Meal")

#Product Categories create
ProductCategory.create(name:"1new")
ProductCategory.create(name:"2bread")
ProductCategory.create(name:"3vegetables")
ProductCategory.create(name:"4fruit")
ProductCategory.create(name:"5oils")
ProductCategory.create(name:"6spices")
ProductCategory.create(name:"7cans and jars")
ProductCategory.create(name:"8vegan")
ProductCategory.create(name:"9prepared food")
ProductCategory.create(name:"10meat")
ProductCategory.create(name:"11fish")
ProductCategory.create(name:"12dairy")
ProductCategory.create(name:"13frozen food")
ProductCategory.create(name:"14loose")
ProductCategory.create(name:"15warm beverages")
ProductCategory.create(name:"16cold drinks")
ProductCategory.create(name:"17cleaning agents")
ProductCategory.create(name:"18hygiene products")


5.times do |x|
  Recipe.create(name: "#{x} Recipe", description: "#{x} description goes brr", recipe_category_id: 1)
end
5.times do |x|
  Recipe.create(name: "2#{x} Recipe", description: "#{x} description goes brr", recipe_category_id: 2)
end
5.times do |x|
  Recipe.create(name: "3#{x} Recipe", description: "#{x} description goes brr", recipe_category_id: 3)
end
5.times do |x|
  Recipe.create(name: "4#{x} Recipe", description: "#{x} description goes brr", recipe_category_id: 4)
end
5.times do |x|
  Recipe.create(name: "5#{x} Recipe", description: "#{x} description goes brr", recipe_category_id: 5)
end
5.times do |x|
  Recipe.create(name: "6#{x} Recipe", description: "#{x} description goes brr", recipe_category_id: 6)
end