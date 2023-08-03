class CreateMealPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_plans do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
