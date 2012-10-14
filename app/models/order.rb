class Order < ActiveRecord::Base

  attr_accessible :signature, :status, :delivered_at

  acts_as_shopping_cart_using :order_item

  belongs_to :user

  before_create :create_signature

  def self.last_active_order
    with_status(:pending).order(:created_at).last
  end

  def create_signature
    self.signature = SecureRandom.base64(32)
  end

  def taxes
    0
  end

  state_machine :status, :initial => :pending do
    event :request do
      transition pending: :in_progress
    end

    event :finish do
      transition in_progress: :finished
    end

    event :deliver do
      transition finished: :delivered
    end
  end

end
