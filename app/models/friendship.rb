class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :user, :friend_id, :friend, :accepted

  belongs_to :user
  belongs_to :friend, class_name: "User"

  # add validation that checks you're not trying to friend someone that has blocked previous attempts

  def accept!
    update_attributes(accepted: true)
    self.class.create!(user_id: friend_id, friend_id: user_id, accepted: true)
  end

  def reject!
    update_attributes(accepted: false)
  end
end
