class Api::V1::VotesController < ApplicationController
  def index
    @vote = Vote.find(params[:vote_id])
    @vote = @vote.vote
    render json: @vote
  end

  def create
    @vote =  Vote.new(date_suggestion_id: params[:date_suggestion_id], user_id: params[:vote][:user_id])
    if @vote.valid?
      @vote.save
      render json: @vote
    else
      render json: "oops couldn't create you"
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
  end
end
