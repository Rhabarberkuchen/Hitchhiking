class User < ApplicationRecord
  #CarrierWave
  mount_uploader :avatar, UserUploader

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :friend_requests, dependent: :destroy

  def was_friendship_requested_by?(other_user)
    requested = false

    if self.id != other_user.id && self.friend_requests.exists?(user_id: self.id, requester_id: other_user.id)
      requested = true
    end
    return requested
  end


  def is_friends_with?(other_user)
    is_friends = false
    if self.id != other_user.id && self.friends.exists?(other_user.id)
      is_friends = true
    end
    return is_friends
  end


end
