class IdeasController < ApplicationController
  def index
    @ideas = Idea.all.order(id: 'DESC')
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
       redirect_to root_path
       else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:title,:content).merge(user_id: current_user.id)
  end
end