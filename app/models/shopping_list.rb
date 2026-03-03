class ShoppingList < ApplicationRecord
  validates :product_name, presence: true
  belongs_to :product_category
  before_save :downcase_fields

  def downcase_fields
    self.product_name = product_name.downcase.strip
 end
end
