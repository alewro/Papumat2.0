class CreateShoppingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_lists do |t|
      t.string :product_name
      t.float :product_quantity
      t.string :product_category
      t.boolean :is_bought

      t.timestamps
    end
  end
end
