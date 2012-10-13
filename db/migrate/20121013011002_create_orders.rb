class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.time :delivered_at
      t.string :signature

      t.timestamps
    end
  end
end
