class OrderItem < ActiveRecord::Base
  attr_accessible :price, :quantity, :item

  acts_as_shopping_cart_item_for :order

end
