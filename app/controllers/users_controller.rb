class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # methods that calculate which buttons have to be used, depending e.g. who is friends with whom
  helper ButtonHelper


  # GET /users
  # GET /users.json
  # a variable beginning with an @ is an instance variable and can be used in the view that belongs to this controller method
  # here all of the users can be accessed
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @simple_post = @user.simple_posts.last
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # after signing up the user is redirected to his profile
      redirect_to '/users/show'
    else
      render "new"
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

# a friend is added
  def add_friend
    user = User.find(params[:user_id])
    friend = User.find(params[:friend_id])
    user.friends << friend
    # enables ajax
    respond_to do |format|
      format.js
    end
  end

# a friend is removed
  def remove_friend
    user = User.find(params[:user_id])
    friend = User.find(params[:friend_id])
    user.friends.destroy(friend)
    respond_to do |format|
      format.js
    end
  end

# a friend request is created
  def add_friend_request
    requested = User.find(params[:user_id])
    requester =  User.find(params[:requester_id])
    fr = FriendRequest.create(user_id: requested.id, requester_id: requester.id)
    requested.friend_requests << fr
    # ajax
    respond_to do |format|
      format.js
    end
  end

# if a friend request is accepted the request has to be deleted and the user has to be added to the friends collection
  def accept_friend_request
    request = FriendRequest.find(params[:request_id])
    requested = User.find(request.user_id)
    requester = User.find(request.requester_id)
    requested.friends << requester
    requested.friend_requests.destroy(request)
    # ajax
    respond_to do |format|
      format.js
    end
  end

# friend request is deleted
  def deny_friend_request
    request = FriendRequest.find(params[:request_id])
    requested = User.find(request.user_id)
    requested.friend_requests.destroy(request)
    # ajax
    respond_to do |format|
      format.js
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :user_name)
  end
end
