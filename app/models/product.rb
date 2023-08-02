class Product < ApplicationRecord
  belongs_to :recipe
  validate :name
  validate :quantity
  belongs_to :product_category
end
