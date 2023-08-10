class MealPlan < ApplicationRecord
  has_many :recipe_checkings
  has_many :recipes, through: :recipe_checkings
  accepts_nested_attributes_for :recipes, allow_destroy: true
  has_and_belongs_to_many :recipes

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_must_be_before_end_date
  validate :start_date_can_not_be_in_past
  validate :collection

  def start_date_must_be_before_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:start_date, "must be before end date")
    end
  end

  def start_date_can_not_be_in_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "must not be in the past")      
    end    
  end

  def collection
    if recipe_ids.empty?
      errors.add(:you, "have to choose at least one recipe") 
    end    
  end
end