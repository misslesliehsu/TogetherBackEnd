class Api::V1::FriendshipsController < ApplicationController


  def index
    @user = User.find(params[:user_id])
    @friends = @user.friends
    @nonFriends = User.all - @friends
    @result = {friends: @friends, nonFriends: @nonFriends}
    render json: @result
  end


  def create
    @new_friendships = Friendship.create_reciprocal_for_ids(params[:user_id], params[:friend_id])
    render json: @new_friendships
  end


  def destroy
    debugger
    Friendship.destroy_reciprocal_for_ids(params[:user_id], params[:friend_id])
  end

end
