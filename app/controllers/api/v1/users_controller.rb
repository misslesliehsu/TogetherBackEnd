class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      render json: @user
    else
      # render json: {errors: @user.errors.full_messages}, status: 500
      render json: {errors:"uh oh can't create you"}
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      @user.save
      render json: @user
    else
      render json: {errors:"uh oh can't update you"}
      # render json: {errors: @user.errors.full_messages}, status: 400
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end


  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :email, :password)
  end


end
