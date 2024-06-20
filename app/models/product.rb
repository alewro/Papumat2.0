class Product < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true
  validates :quantity, presence: true
  before_save :downcase_fields

  def downcase_fields
    self.name = name[0].downcase + name[1..-1]
 end
end
