class RemoveProductCategoryFromShoppingList < ActiveRecord::Migration[7.0]
  def change
    remove_column :shopping_lists, :product_category
  end
end
