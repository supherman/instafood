class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :menu_item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
