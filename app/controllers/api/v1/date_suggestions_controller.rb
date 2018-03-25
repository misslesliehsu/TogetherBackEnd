class Api::V1::DateSuggestionsController < ApplicationController

    def index
      @idea = Idea.find(params[:idea_id])
      @date_suggestions = @idea.date_suggestions
      render json: @date_suggestions
    end

    def create
      @date_suggestion = DateSuggestion.new(idea_id: params[:idea_id], date: params[:date], friendly_date: params[:friendly_date])
      if @date_suggestion.valid?
        @sdate_suggestion.save
        render @date_suggestion
      else
        render json: "oops couldn't create you"
      end
    end

    def destroy
      @date_suggestion = DateSuggestion.find(params[:id])
      @date_suggestion.destroy
    end
end
