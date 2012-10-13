class OrderDetail < ActiveRecord::Base

  attr_accessible :menu_item_id, :order_id, :quantity

  belongs_to :order
  belongs_to :menu_item

end
