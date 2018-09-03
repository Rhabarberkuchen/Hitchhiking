class User < ApplicationRecord
ApplicationRecord
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
