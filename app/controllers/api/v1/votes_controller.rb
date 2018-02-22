class Api::V1::VotesController < ApplicationController
  def index
    @vote = Vote.find(params[:vote_id])
    @vote = @vote.vote
    render json: @vote
  end

  def create
    @vote =  Vote.new(vote_params)
    if @vote.valid?
      @svote.save
      render @vote
    else
      render json: "oops couldn't create you"
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
  end
end
