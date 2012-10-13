class Order < ActiveRecord::Base

  attr_accessible :signature, :status, :delivered_at

  acts_as_shopping_cart_using :menu_item

  validates :status, presence: true
  validates :signature, presence: true

end
