class Api::V1::InvitationsController < ApplicationController

  def index
    @invitations = Invitation.all
    render json: @invitations
  end

  def show
    @invitation = Invitation.find_by(invitee_id: params[:invitee_id], idea_id: params[:idea_id])
    render json: @invitation
  end

  def update
    @invitation = Invitation.find_by(invitee_id: params[:invitee_id], idea_id: params[:idea_id])
    @invitation.update(accepted: params[:response])
    @invitation.save
  end

  def create
    @invitations = IdeaComment.new(invitations_params)
    if @invitations.valid?
      @sinvitations.save
      render json: @invitations
    else
      render json: "oops couldn't create you"
    end
  end

  def destroy
    @invitation = Invitation.find_by(invitee_id: params[:invitee_id], idea_id: params[:idea_id])
    @invitation.destroy
    render json: "destroyed"
  end
end
