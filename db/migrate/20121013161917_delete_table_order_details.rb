class DeleteTableOrderDetails < ActiveRecord::Migration
  def change
    drop_table :order_details
  end
end
