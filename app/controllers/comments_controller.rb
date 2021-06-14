class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
      #redirect_to "/prototypes/#{@comment.prototype.id}"上と同じ意味
    else
      redirect_to prototype_path(@comment.prototype.id)
      #@prototype = Prototype.find(params[:prototype_id])
      #render "prototypes/show"
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
