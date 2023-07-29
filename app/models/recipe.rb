class Recipe < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  validates :description, presence: true
  belongs_to :recipe_category
  validates :recipe_category_id, presence: true
end
