class MealPlan < ApplicationRecord
  has_many :recipe_checkings
  has_many :recipes, through: :recipe_checkings
  accepts_nested_attributes_for :recipes, allow_destroy: true
  has_and_belongs_to_many :recipes
end
