class MenuItem < ActiveRecord::Base

  attr_accessible :available, :category_id, :description, :name, :price

  belongs_to :category

  has_many :order_details
  has_many :orders, through: :order_details

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
