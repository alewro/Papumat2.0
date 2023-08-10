class Product < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true
  validates :quantity, presence: true
  before_save :downcase_fields

  def downcase_fields
    self.name.downcase!
 end
end
