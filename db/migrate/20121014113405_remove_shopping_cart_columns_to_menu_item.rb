class RemoveShoppingCartColumnsToMenuItem < ActiveRecord::Migration
  def change
    change_table :menu_items do |t|
      t.remove :owner_id
      t.remove :owner_type
      t.remove :quantity
      t.remove :item_id
      t.remove :item_type
    end
  end
end
