class AddOrderHintToRecipeCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_categories, :order_hint, :float
  end
end
