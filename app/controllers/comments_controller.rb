class CommentsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @comment = @wiki.comments.new(comment_params)
    if @comment.save
      redirect_to wiki_path(@wiki)
    else
      @comments = @wiki.comments.all
      flash[:alert] = "There was a problem with the new comment you tried to post, please try again."
      render "/wikis/show.html.erb"
    end
  end
private
  def comment_params
    params.require(:comment).permit(:name, :response, :url)
  end
end
