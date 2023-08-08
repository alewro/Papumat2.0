class AllProduct < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
end
