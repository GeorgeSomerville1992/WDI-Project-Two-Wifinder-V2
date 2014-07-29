class SavedNetwork < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :public, :security_type, :wifi_name, :wifi_pw, :image

  belongs_to :user

  geocoded_by :address
  validates :address, presence: true
  validates :wifi_name, presence: true



  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def self.friends_networks(user)
    user.friends.map do |friend|
      friend.saved_networks
    end.flatten
  end
end
