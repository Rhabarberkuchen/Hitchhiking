class FriendshipsController < ApplicationController
    helper ButtonHelper

  def index
    user = current_user
    @friends = user.friends
  end

end
