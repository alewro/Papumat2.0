class Product < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true
  validates :quantity, presence: true
  belongs_to :product_category
end
