class Order < ActiveRecord::Base

  attr_accessible :signature, :status, :delivered_at

  acts_as_shopping_cart_using :menu_item

  belongs_to :user

  before_create :create_signature

  def self.last_active
    order(:created_at).last
  end

  def create_signature
    self.signature = SecureRandom.base64(32)
  end

end
