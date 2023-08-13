class AddOrderHintToShoppingList < ActiveRecord::Migration[7.0]
  def change
    add_column :shopping_lists, :order_hint, :float
  end
end
