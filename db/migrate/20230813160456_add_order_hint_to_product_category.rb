class AddOrderHintToProductCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :product_categories, :order_hint, :float
  end
end
