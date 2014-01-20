class CommentsController < ApplicationController
  def create
    
    @comment = Comment.new
    @comment.article_id = params[:id]
    @comment.commentor = params[:commentor]
    @comment.content = params[:content]
    @comment.Ip = request.ip
    
    if verify_recaptcha() && @comment.save then
      redirect_to article_url
    else
      redirect_to article_url, notice: 'failed to comment'
    end
    
    
  end

  def destroy
  end
end
