class Category < ActiveRecord::Base

  attr_accessible :name

  has_many :menu_items

  validates :name, presence: true

end
