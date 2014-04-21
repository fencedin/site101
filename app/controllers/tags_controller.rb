class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      @tags = Tag.all
      flash[:alert] = "There was a problem with the new tag"
      render "index"
    end
  end
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to :back
  end

private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
