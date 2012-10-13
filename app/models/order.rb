class Order < ActiveRecord::Base

  attr_accessible :signature, :status, :delivered_at

  has_many :order_details
  has_many :menu_items, throug: :order_details

  validates :status, presence: true
  validates :signature, presence: true

end
