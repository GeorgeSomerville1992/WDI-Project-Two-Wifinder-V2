class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  # validate :disallow_self_referential_friendship

  def accept
    @friendship = Friendship.find(params[:id])
    @friendship.accept!
    redirect_to :back
  end

  def reject
    @friendship = Friendship.find(params[:id])
    @friendship.reject!
    redirect_to :back
  end

  # def disallow_self_referential_friendship
  #   if friend_id == current_user.id
  #     errors.add(:friend_id, 'cannot add yourself as a friend')
  #   end
  # end
end
