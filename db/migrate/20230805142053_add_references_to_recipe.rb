class AddReferencesToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :recipe_done, null: false, foreign_key: true
  end
end
