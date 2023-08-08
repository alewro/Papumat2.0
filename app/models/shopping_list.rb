class ShoppingList < ApplicationRecord
  validates :product_name, presence: true
end
