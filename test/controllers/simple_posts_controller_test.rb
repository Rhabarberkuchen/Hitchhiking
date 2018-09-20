require 'test_helper'

class SimplePostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:elel)
    @simple_post = simple_posts(:one)
  end

  # test "should get index" do
  #   get user_simple_posts_url(@user, @simple_post)
  #   assert_response :success
  # end

  test "should get new" do
    get new_user_simple_post_url(@user, @simple_post)
    assert_response :success
  end

  test "should create simple_post" do
    assert_difference('SimplePost.count') do
    post user_simple_posts_url(@user, @simple_post), params: { simple_post: { pictures: @simple_post.pictures, text: @simple_post.text, title: @simple_post.title, user: @simple_post.users } }
    end

    assert_redirected_to @user
  end

  test "should show simple_post" do
    get user_simple_post_url(@user, @simple_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_simple_post_url(@user, @simple_post)
    assert_response :success
  end

  test "should update simple_post" do
    patch user_simple_post_url(@user, @simple_post), params: { simple_post: { pictures: @simple_post.pictures, text: @simple_post.text, title: @simple_post.title, user_id: @simple_post.user_id } }
    assert_redirected_to @user
  end

  test "should destroy simple_post" do
    assert_difference('SimplePost.count', -1) do
      delete user_simple_post_url(@user, @simple_post)
    end

    assert_redirected_to user_url(@user)
  end
end
