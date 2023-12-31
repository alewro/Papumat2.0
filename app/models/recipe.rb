class Recipe < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  validates :description, presence: true

  belongs_to :recipe_category
  validates :recipe_category_id, presence: true

  has_many :products, dependent: :destroy, inverse_of: :recipe
  accepts_nested_attributes_for :products, allow_destroy: true, reject_if: :all_blank

  has_many :meal_plans, through: :recipe_checkings
  has_many :recipe_checkings

  has_and_belongs_to_many :meal_plans
end