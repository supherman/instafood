class AddShoppingCartColumnsToMenuItem < ActiveRecord::Migration
  def change
    change_table :menu_items do |t|
      t.remove :price
      t.shopping_cart_item_fields
    end
  end
end
