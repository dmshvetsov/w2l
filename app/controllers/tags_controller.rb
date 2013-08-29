class TagsController < ApplicationController
  def index
    @tags = Tag.first(100)
    @total_likes = Like.all.count
    @total_dislikes = Dislike.all.count
  end
  
  def like
    Like.create(tag_id: params[:liked_tag_id], user_id: params[:user_who_liked])
    redirect_to :back
  end
  
  def dislike
    Dislike.create(tag_id: params[:disliked_tag_id], user_id: params[:user_who_disliked])
    redirect_to :back
  end
end
