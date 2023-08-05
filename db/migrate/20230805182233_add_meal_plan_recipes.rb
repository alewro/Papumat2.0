class AddMealPlanRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_plans_recipes, id: false do |t|
      t.belongs_to :recipe
      t.belongs_to :meal_plan
    
      t.timestamps
    end
  end
end
