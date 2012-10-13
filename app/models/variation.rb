class Variation < ActiveRecord::Base
  attr_accessible :menu_item_id, :name, :price

  belongs_to :menu_item

end
