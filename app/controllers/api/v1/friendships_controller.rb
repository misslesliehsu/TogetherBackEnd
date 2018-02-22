class Api::V1::FriendshipsController < ApplicationController


  def index
    @user = User.find(params[:user_id])
    @friendships = @user.friends
    render json: @friendships
  end


  def create
    @new_friendships = Friendship.create_reciprocal_for_ids(params[:user_id], params[:id]))
    render json: @new_friendships
  end


  def destroy
    Friendship.destroy_reciprocal_for_ids(params[:user_id], params[:id])
  end

end
