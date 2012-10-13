class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.string :name
      t.float :price
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
