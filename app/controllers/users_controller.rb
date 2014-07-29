class UsersController < Devise::RegistrationsController
  before_filter :authenticate_user!

  def index
    if user_signed_in?
      @users = User.all
      @friends = current_user.friends
    else
      redirect_to new_user_session_path, notice: "You need to sign in or sign up before continuing."
    end
  end

  def show
    if user_signed_in?
      @user = User.find params[:id]
      @invites = @user.pending_friend_invites_received.includes(:user)
      @friends = current_user.friends
    else
      redirect_to new_user_session_path, notice: "You need to sign in or sign up before continuing."
    end
  end

  def befriend
    if user_signed_in?
    @user = User.find params[:id]
    Friendship.create!(user: current_user, friend: @user)
    flash[:notice] = "Invite sent"
    redirect_to saved_networks_path
  else
    redirect_to new_user_session_path, notice: "You need to sign in or sign up before continuing."
    end
  end

end
