class AddProductCategoryToShoppingList < ActiveRecord::Migration[7.0]
  def change
    add_reference :shopping_lists, :product_category, default: 1, null: false, foreign_key: true
  end
end
