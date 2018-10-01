class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper ButtonHelper


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@user = current_user
    @user = User.find(params[:id])
    @simple_post = @user.simple_posts.last
  end

  # GET /users/new
  def new
    # render layout: 'sessions'
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
      redirect_to '/users/show'
      #  format.html { redirect_to @user, notice: 'User was successfully created.' }
      #  format.json { render :show, status: :created, location: @user }
    else
      render "new"
      #format.html { render :new }
      #format.json { render json: @user.errors, status: :unprocessable_entity }
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_friend
    user = User.find(params[:user_id])
    friend = User.find(params[:friend_id])
    user.friends << friend
    respond_to do |format|
      format.js
    end
  end

  def remove_friend
    user = User.find(params[:user_id])
    friend = User.find(params[:friend_id])
    user.friends.destroy(friend)
    respond_to do |format|
      format.js
    end
  end

  def add_friend_request
    requested = User.find(params[:user_id])
    requester =  User.find(params[:requester_id])
    fr = FriendRequest.create(user_id: requested.id, requester_id: requester.id)
    requested.friend_requests << fr
    respond_to do |format|
      format.js
    end
  end

  def accept_friend_request
    request = FriendRequest.find(params[:request_id])

    requested = User.find(request.user_id)
    requester = User.find(request.requester_id)
    requested.friends << requester
    requested.friend_requests.destroy(request)
    respond_to do |format|
      format.js
    end
  end

  def deny_friend_request
    request = FriendRequest.find(params[:request_id])
    requested = User.find(request.user_id)
    requested.friend_requests.destroy(request)
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
