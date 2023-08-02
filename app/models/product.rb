class Product < ApplicationRecord
  belongs_to :recipe
  validate :name
  validate :quantity
end
