class FriendRequest < ActiveRecord::Base
  belongs_to :user

  def index
    @friend_requests = current_user.friend_requests
  end





end
