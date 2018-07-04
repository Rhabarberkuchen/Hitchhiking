class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(user_id: self.friend.id, friend_id: self.user.id)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_friendship)
  end
  def inverse_friendship
    {user_id: self.friend_id, friend_id: self.user_id}
    #code
  end

  def inverses
    self.class.where(inverse_friendship)
  end
end
