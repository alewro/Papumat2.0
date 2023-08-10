class ShoppingList < ApplicationRecord
  validates :product_name, presence: true
  before_save :downcase_fields

  def downcase_fields
    self.product_name.downcase!
 end
end
