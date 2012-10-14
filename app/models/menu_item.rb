class MenuItem < ActiveRecord::Base

  attr_accessible :available, :category_id, :description, :name, :price, :quantity, :item

  belongs_to :category
  has_many :variations

  mount_uploader :photo, MenuItemPhotoUploader

  validates :name, presence: true

  def variations_prices
    if variations.any?
      variations.pluck(:price)
    else
      [price]
    end
  end
end
