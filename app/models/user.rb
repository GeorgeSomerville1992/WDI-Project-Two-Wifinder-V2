class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :confirm_within => 10.minutes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  validates :name, presence: true

  has_many :saved_networks

  has_many :friendships
  has_many :friends,
              through:    :friendships,
              class_name: 'User',
              conditions: "accepted = true"

  has_many :pending_friend_invites_sent,
              class_name: 'Friendship',
              conditions: "accepted IS NULL"

  has_many :rejected_friend_invites_sent,
              class_name: 'Friendship',
              conditions: "accepted = false"

  has_many :pending_friend_invites_received,
              class_name:  'Friendship',
              foreign_key: :friend_id,
              conditions:  "accepted IS NULL"

  has_many :rejected_friend_invites_received,
              class_name:  'Friendship',
              foreign_key: :friend_id,
              conditions:  "accepted = false"

  has_many :accepted_friend_invites_received,
              class_name:  'Friendship',
              foreign_key: :friend_id,
              conditions:  "accepted = true"
  # def invite_pending?(user)
  #   puts "pending -> #{pending_friend_invites_sent}"
  #   rst = pending_friend_invites_sent.map(&:user_id)
  # end

  def is_friends_with?(other_user)
    friendships.where(friend_id: other_user.id, accepted: true).count > 0
  end

  before_save :set_default_role

  def role? role
  	self.role.to_s == role.to_s
  end

  def set_default_role
  	if self.role.nil?
  		self.role = "user"
  	end
  end
end




# friendships both foreign keys pointing t the user table
# two different names
# join model lets call friender and friendee
# has one friender, class name user
# has one friendee, class name user

# user model has many friends as friender
# user model has many friends as friendee

# make a method that lists all the users
# add boolean accept/reject >> way to confirm a friendships
# add migration to
