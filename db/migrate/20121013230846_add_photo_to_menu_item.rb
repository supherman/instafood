class AddPhotoToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :photo, :string
  end
end
