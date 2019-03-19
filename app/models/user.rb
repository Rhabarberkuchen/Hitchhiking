class User < ApplicationRecord
  #CarrierWave
  #initiate the uploaders for the pictures in profile and for posts
  mount_uploader :avatar, UserUploader
  mount_uploader :pictures, PostPicturesUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

# associations
  has_many :friendships
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :friend_requests

  has_many :simple_posts

#who sent die request? to show the deny/accept view to the right person
  def was_friendship_requested_by?(other_user)
    requested = false
    if self.id != other_user.id && self.friend_requests.exists?(user_id: self.id, requester_id: other_user.id)
      requested = true
    end
    return requested
  end

# for the add friend/defriend button
  def is_friends_with?(other_user)
    is_friends = false
    if self.id != other_user.id && self.friends.exists?(other_user.id)
      is_friends = true
    end
    return is_friends
  end


end
