class Api::V1::IdeasController < ApplicationController

    def index
      @ideas = Idea.all
      render json: @ideas
    end

    def show
      @idea = Idea.find(params[:id])
      render json: @idea
    end

    def create
      @idea = Idea.new(idea_params)
      if @idea.valid?
        @idea.save
        render json: @idea
      else
        # render json: {errors: @idea.errors.full_messages}, status: 500
        render json: {errors:"uh oh can't create you"}
      end
    end

    def update
      @idea = Idea.find(params[:id])
      @idea.update(idea_params)
      if @idea.valid?
        @idea.save
        render json: @idea
      else
        render json: {errors:"uh oh can't update you"}
        # render json: {errors: @idea.errors.full_messages}, status: 400
      end
    end

    def destroy
      @idea = Idea.find(params[:id])
      @idea.destroy
    end


    private
    def idea_params
      params.require(:idea).permit(:name, :location, :description, :owner_id)
    end

end
