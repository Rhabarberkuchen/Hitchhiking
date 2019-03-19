class FriendshipsController < ApplicationController
  #includes methods to check if an edit button or a friend button is needed
    helper ButtonHelper

#is used for friendships overview
  def index
    @friends = current_user.friends
  end

end
