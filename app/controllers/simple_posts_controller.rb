
class SimplePostsController < ApplicationController
  before_action :set_simple_post, only: [:show, :edit, :update, :destroy]
  # for the buttons that are used in the views
  helper ButtonHelper

  # GET /simple_posts
  # GET /simple_posts.json
  # for overview of simple posts
  # a variable beginning with an @ is an instance variable and can be used in the view that belongs to this controller method
  # here all of the simple posts can be accessed
  def index
    @simple_posts = SimplePost.all
  end

  # GET /simple_posts/1
  # GET /simple_posts/1.json
  def show
    @user = User.find(params[:user_id])
    @simple_post = SimplePost.find(params[:id])
    # adjusts ajax
    respond_to do |format|
      format.js
    end
  end

  # GET /simple_posts/new
  def new
    @simple_post = SimplePost.new
    # hh_attribute, start and location have to be build in case it is used for creating a post
    @hh_attribute = @simple_post.build_hh_attribute
    @hh_attribute.build_start
    @hh_attribute.build_destination
    @user = User.find(params[:user_id])
  end

  # GET /simple_posts/1/edit
  def edit
    @user = User.find(params[:user_id])
    if @simple_post.hh_attribute.nil?
      @simple_post.build_hh_attribute
      @hh_attribute = @simple_post.hh_attribute
      @hh_attribute.build_start
      @hh_attribute.build_destination
    end
  end

  # POST /simple_posts
  # POST /simple_posts.json
  def create
    @simple_post = SimplePost.new(simple_post_params)
    @user = User.find(params[:user_id])
    @simple_post.user = @user
    respond_to do |format|
      # regulates behaviour after success or failure of saving
      if @simple_post.save
        # user is redirected to her profile
        format.html { redirect_to @user, notice: 'Simple post was successfully created.' }
      else
        # otherwise the view for new post is rerendered
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /simple_posts/1
  # PATCH/PUT /simple_posts/1.json
  def update
    @user = User.find(params[:user_id])
    respond_to do |format|
      if @simple_post.update(simple_post_params)
        format.html { redirect_to @user, notice: 'Simple post was successfully updated.' }
        format.json { render :show, status: :ok, location: @simple_post }
      else
        format.html { render :edit }
        format.json { render json: @simple_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_posts/1
  # DELETE /simple_posts/1.json
  def destroy
    @user = User.find(params[:user_id])
    @simple_post.destroy
    @simple_post = @user.simple_posts.last
    # enables ajax
    respond_to do |format|
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_simple_post
    @simple_post = SimplePost.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # Those attributes can be accessed through CRUD actions
  def simple_post_params
    params.require(:simple_post).permit(:id, :title, :text, {pictures: []},:user,
      hh_attribute_attributes: [:days, :hours, :minutes, :lifts, :id, :simple_post_id, :_destroy,
        start_attributes: [:id, :address, :longitude, :latitude, :hh_attribute_id, :_destroy],
      destination_attributes: [:id, :address, :longitude, :latitude, :hh_attribute_id, :_destroy]])
    end
  end
