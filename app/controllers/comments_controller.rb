class CommentsController < ApplicationController
  
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    @comments = @prototype.comments.includes(:user)
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
    else
      #redirect_to prototype_path(@comment.prototype.id)
      render 'prototypes/show'
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
