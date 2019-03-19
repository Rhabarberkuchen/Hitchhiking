module ButtonHelper

#checks if the shown profile is your own and if not, if it's a friend of yours and adjusts the button
  def friends_and_edit_button(current_user, friend)
    if friend.id == current_user.id;
      link_to svg('edit-2'), edit_user_path,  class: "btn float-right"
    elsif current_user.is_friends_with?(friend)
      link_to svg('user-minus'), users_remove_friend_path(user_id: current_user.id, friend_id: friend.id),remote: true,  method: :post, class: "btn float-right"
    elsif current_user.was_friendship_requested_by?(friend) || friend.was_friendship_requested_by?(current_user)
      link_to svg('user-plus'), "#", class: "btn float-right disabled"
    else
      link_to svg('user-plus'), users_add_friend_request_path(requester_id: current_user.id, user_id: friend.id), remote: true, method: :post, class: "btn float-right"
    end
  end

#checks if you are the user of the shown profile so you can edit or delete a post
  def simple_posts_edit_button(current_user, simple_post)
    if(current_user.id == @user.id)
      link_to svg('edit-2'), edit_user_simple_post_path(current_user, simple_post), class:"btn"
    end
  end

  def simple_posts_delete_button(current_user, simple_post)
    if(current_user.id == @user.id)
      link_to svg('x-square'), [current_user, simple_post], remote: true, method: :delete, class:"btn"
    end
  end

#checks if there is a previous or next post
  def next_post_button(user, simple_post)
    next_post = simple_post.next
    if(!next_post.nil?)
      link_to svg('chevron-right'), [user, next_post], remote: true, class: "btn float-right"
    end
  end

  def previous_post_button(user, simple_post)
    prev_post = simple_post.prev
    if(!prev_post.nil?)
      link_to svg('chevron-left'), [user, prev_post], remote: true, class: "btn float-left"
    end
  end

end
