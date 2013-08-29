class TagsController < ApplicationController
  def index
    @tags = Tag.first(100)
    @total_likes = Like.all.count
  end
  def like
    Like.create(tag_id: params[:liked_tag_id], user_id: params[:user_who_liked])
    redirect_to :back
  end
end
