#
# class HhAttributesController < ApplicationController
#   before_action :set_hh_attribute, only: [:show, :edit, :update, :destroy]
#
#   # GET /hh_attributes
#   # GET /hh_attributes.json
#   def index
#     @hh_attributes = HhAttribute.all
#   end
#
#   # GET /hh_attributes/1
#   # GET /hh_attributes/1.json
#   def show
#     @hh_attribute = HhAttribute.find(params[:id])
#   end
#
#   # GET /hh_attributes/new
#   def new
#
#     @hh_attribute = HhAttribute.new
#   end
#
#   # GET /hh_attributes/1/edit
#   def edit
#   end
#
#   # POST /hh_attributes
#   # POST /hh_attributes.json
#   def create
#     @hh_attribute = HhAttribute.new(hh_attribute_params)
#     # @hh_attribute.save
#     # redirect_to @user
#     respond_to do |format|
#       if @hh_attribute.save
#         # format.html { redirect_to @user, notice: 'Simple post was successfully created.' }
#         # format.json { render :show, status: :created, location: @hh_attribute }
#       # else
#         # format.html { render :new }
#         # format.json { render json: @hh_attribute.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # PATCH/PUT /hh_attributes/1
#   # PATCH/PUT /hh_attributes/1.json
#   def update
#     # @hh_attribute.update(hh_attribute_params)
#     # redirect_to @user
#     respond_to do |format|
#       if @hh_attribute.update(hh_attribute_params)
#          flash[:notice] = "success"
#         format.html { redirect_to @user, notice: 'Simple post was successfully updated.' }
#         format.json { render :show, status: :ok, location: @hh_attribute }
#       else
#         format.html { render :edit }
#         format.json { render json: @hh_attribute.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # DELETE /hh_attributes/1
#   # DELETE /hh_attributes/1.json
#   def destroy
#     @hh_attribute.destroy
#     respond_to do |format|
#       #   format.html { redirect_to hh_attributes_url, notice: 'Simple post was successfully destroyed.' }
#       format.js
#     end
#   end
#
#   private
#   # Use callbacks to share common setup or constraints between actions.
#   def set_hh_attribute
#     @hh_attribute = HhAttribute.find(params[:id])
#   end
#
#   # Never trust parameters from the scary internet, only allow the white list through.
#   def hh_attribute_params
#     params.require(:hh_attribute).permit(:start, :destination, :time, :stops, :simple_post)
#   end
# end
