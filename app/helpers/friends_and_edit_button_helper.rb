module FriendsAndEditButtonHelper
  def friends_and_edit_button(current_user, friend)
    if friend.id == current_user.id;
      link_to svg('edit-2'), edit_user_path, class: "btn float-right"
    elsif current_user.is_friends_with?(friend)
      link_to svg('user-minus'), users_remove_friend_path(user_id: current_user.id, friend_id: friend.id), method: :post, class: "btn float-right"
    elsif current_user.was_friendship_requested_by?(friend) || friend.was_friendship_requested_by?(current_user)
      link_to svg('user-plus'), "#", class: "btn float-right disabled"

    else
      link_to svg('user-plus'), users_add_friend_request_path(requester_id: current_user.id, user_id: friend.id), method: :post, class: "btn float-right"
    end
  end
end
