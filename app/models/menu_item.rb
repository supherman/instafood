class MenuItem < ActiveRecord::Base

  attr_accessible :available, :category_id, :description, :name, :price

  belongs_to :category
  has_many :variations

  mount_uploader :photo, MenuItemPhotoUploader

  acts_as_shopping_cart_item_for :order

  validates :name, presence: true

end
