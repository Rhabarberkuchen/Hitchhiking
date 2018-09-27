class FriendshipsController < ApplicationController
    helper ButtonHelper

  def index
    @friends = current_user.friends
  end

end
