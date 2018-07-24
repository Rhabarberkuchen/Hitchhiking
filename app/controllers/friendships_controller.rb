class FriendshipsController < ApplicationController
    helper FriendsAndEditButtonHelper
  def index
    user = current_user
    @friends = user.friends
  end


end
