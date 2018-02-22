class Api::V1::IdeaCommentsController < ApplicationController

  def index
    @idea = Idea.find(params[:idea_id])
    @idea_comments = @idea.idea_comments
    render json: @idea_comments
  end

  def create
    @idea_comment = IdeaComment.new(idea_comment_params)
    if @idea_comment.valid?
      @sidea_comment.save
      render @idea_comment
    else
      render json: "oops couldn't create you"
    end
  end

  def destroy
    @idea_comment = IdeaComment.find(params[:id])
    @idea_comment.destroy
  end

private

  def idea_comment_params
    params.require(:idea_comment).permit(:user_id, :idea_id, :content)
  end

end
