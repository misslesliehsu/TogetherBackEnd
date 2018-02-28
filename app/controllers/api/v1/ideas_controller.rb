class Api::V1::IdeasController < ApplicationController

    def index
      #return all ideas for which current user is the owner, or an invitee
      @ideas = Idea.all.select do |i|
        i.owner_id == params[:user_id].to_i ||
        i.invitees.include?(User.find(params[:user_id]))
      end
      render json: @ideas
    end

    def show
      @idea = Idea.find(params[:id])
      @date_suggestions = @idea.date_suggestions
      @packed_date_suggestions = @date_suggestions.map do |d|
        {date: d.date, voters: d.users, id: d.id}
      end
      @invitees = @idea.invitees
      @result = {idea: @idea, date_suggestions: @packed_date_suggestions, invitees:@invitees}
      render json: @result
    end

    def create
      @idea = Idea.new(name: params[:idea][:name], location: params[:idea][:location], owner_id: params[:idea][:owner_id], description: params[:idea][:description] )
      if @idea.valid?
        @idea.save
        params[:date_suggestions].each do |d|
          date_suggestion = DateSuggestion.new(idea_id: @idea.id, date: d)
          date_suggestion.save if date_suggestion.valid?
        end
        params[:invitees].each do |i|
          user = User.find(i["id"])
          @idea.invitees.push(user)
        end

        render json: @idea.id
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
        ###Note - there is no update of invitees/invitations or date_suggestions - only creation & destruction
        @idea.date_suggestions.destroy_all
        params[:date_suggestions].each do |d|
          date_suggestion = DateSuggestion.new(idea_id: @idea.id, date: d)
          date_suggestion.save if date_suggestion.valid?
        end
        @idea.invitations.destroy_all
        params[:invitees].each do |i|
          user = User.find(i["id"])
          @idea.invitees.push(user)
        end
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
