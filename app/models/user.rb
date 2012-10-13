class User < ActiveRecord::Base

  devise :omniauthable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :provider, :uid

  has_many :orders

  def self.find_for_twitter_oauth(auth)
    user = User.where(provider: auth[:provider], uid: auth[:uid]).first
    unless user
      user = User.create(provider: auth[:provider], uid: auth[:uid])
    end
    user
  end

end
