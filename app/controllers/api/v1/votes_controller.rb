class Api::V1::VotesController < ApplicationController

  # def index
  #   @vote = Vote.find(params[:vote_id])
  #   @vote = @vote.vote
  #   render json: @vote
  # end



  def create
    @vote =  Vote.new(date_suggestion_id: params[:date_suggestion_id], voter_id: params[:user_id])
    if @vote.valid?
      @vote.save
      render json: @vote
    else
      render json: "oops couldn't create you"
    end
  end

  def destroy
    @vote = Vote.find_by(voter_id: params[:user_id], date_suggestion_id: params[:date_suggestion_id])
    @vote.destroy
    render json: "destroyed"
  end
end
