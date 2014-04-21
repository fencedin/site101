class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    @visible_wikis = []
    @wikis.each do |wiki|
      if !wiki.hidden?
        @visible_wikis << wiki
      end
    end
    @wiki = Wiki.new
    @tag = Tag.new
    @tags = Tag.all
  end
  def create
    @wiki = Wiki.new(wiki_params)
    if @wiki.save
      redirect_to wikis_path
    else
      @wikis = Wiki.all
      flash[:alert] = "There was a problem with the new post"
      render "index"
    end
  end
  def update
    params[:wiki][:tags_ids] ||= []
    @wiki = Wiki.find(params[:id])
    if @wiki.update(wiki_params)
    redirect_to wikis_path
    else
      render 'show'
    end
  end
  def show
    @wiki = Wiki.find(params[:id])
    @comment = Comment.new
  end
  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
    redirect_to :back
  end

private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :hidden, {tag_ids: []})
  end
end
