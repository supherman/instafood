class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.shopping_cart_item_fields
      t.timestamps
    end
  end
end
