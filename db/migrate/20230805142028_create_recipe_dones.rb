class CreateRecipeDones < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_dones do |t|
      t.boolean :is_done, default: false

      t.timestamps
    end
  end
end
