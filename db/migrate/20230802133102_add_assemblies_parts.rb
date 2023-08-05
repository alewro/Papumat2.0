class AddAssembliesParts < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_checkings do |t|
      t.belongs_to :recipe
      t.belongs_to :meal_plan
      t.boolean :is_done
    
      t.timestamps
    end
  end
end
