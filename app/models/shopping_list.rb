class ShoppingList < ApplicationRecord
  validates :product_name, presence: true
  belongs_to :product_category
  before_save :downcase_fields

  def downcase_fields
    self.product_name = product_name[0].downcase + product_name[1..-1]
 end
end
