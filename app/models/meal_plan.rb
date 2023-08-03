class MealPlan < ApplicationRecord
  has_and_belongs_to_many :recipes
  accepts_nested_attributes_for :recipes, allow_destroy: true
end
