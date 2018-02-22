class Api::V1::InvitationsController < ApplicationController
  def index
    @invitations = Idea.find(params[:invitations_id])
    @invitations = @invitations.invitations
    render json: @invitations
  end

  def create
    @invitations = IdeaComment.new(invitations_params)
    if @invitations.valid?
      @sinvitations.save
      render @invitations
    else
      render json: "oops couldn't create you"
    end
  end

  def destroy
    @invitations = IdeaComment.find(params[:id])
    @invitations.destroy
  end
end
