class CommentsController < ApplicationController

  # def index
  #   @comments = Comment.all
    
  # end

#   def create
#     .@comment = Comment.new(comment_params)
#     if @comment.save
#       redirect_to idea_path(@comment.idea)
#      else
#       @idea = @comment.idea
#       @comments = @idea.comments
#       render "ideas/show"
#     end
#   end

  




#   private
#   def comment_params
#     params.require(:comment).permit(:text).merge(user_id: current_user.id, idea_id: params[:idea_id])
#   end
# end


# class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to idea_path(@comment.idea) # method: :get # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      # @idea = @comment.idea
      # @comments = @idea.comments
      render "ideas/show" # views/tweets/show.html.erbのファイルを参照しています。
    end
  end

  def destroy
    
    #  comment = Comment.find(params[:id],idea_id: params[:idea_id])
    @comment = Comment.find(params[:id])
    # @idea = @comment.idea
    # comment = @idea.comments
   
    @comment.destroy
      flash[:notice] = "コメントを削除しました"
  #  redirect_to idea_path, method: :get
      redirect_to request.referer
  #  redirect_to idea_path(idea.id), method: :get 
      #  redirect_to root_path
      # redirect_t
    # <%= link_to idea.title, idea_path(idea.id), method: :get, class: :card__title%>

  
  end

    # if idea.destroy
    #   # redirect_to root_path 
  
    #   else
    #   render :index
    #   end
    

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, idea_id: params[:idea_id])
  end
end