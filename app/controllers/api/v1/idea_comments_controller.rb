class Api::V1::IdeaCommentsController < ApplicationController

  def index
    @idea_comments= IdeaComment.all.select do |ic|
      ic.idea_id == params[:idea_id].to_i
    end
    render json: @idea_comments
  end

  def create
    @idea_comment = IdeaComment.new(user_id: params[:user_id], idea_id: params[:idea_id], content:params[:content])
    if @idea_comment.valid?
      @idea_comment.save
    end
    render json: @idea_comment
  end


end
