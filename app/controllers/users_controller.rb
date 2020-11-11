class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas.order(id: 'DESC')
    # @comments = @idea.comments.includes(:user).order(id: 'DESC')
  end
end
