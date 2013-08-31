class TagsController < ApplicationController
  def index
    @tags = Tag.all.sort_by { |tag| -(tag.likes.count*3 - tag.dislikes.count*2) }.take(100)
    @total_likes = Like.all.count
    @total_dislikes = Dislike.all.count
    @like = Like.new
    @dislike = Dislike.new
  end
  
  def like
    @like = Like.new(like_params)
    begin
      if @like.save
        redirect_to :back
      else
        render '/public/500', layout: false
      end
    rescue ActiveRecord::RecordNotUnique
      render '/public/500', layout: false
    end
  end
  
  def unlike
    @like = Like.destroy(params[:id])
    redirect_to :back
  end
  
  def dislike
    @dislike = Dislike.new(dislike_params)
    begin
      if @dislike.save
        redirect_to :back
      else
        render '/public/500', layout: false
      end
    rescue ActiveRecord::RecordNotUnique
      render '/public/500', layout: false
    end
  end
  
  def undislike
    @dislike = Dislike.destroy(params[:id])
    redirect_to :back
  end
  
  private
  
  def like_params
    params.require(:like).permit(:tag_id, :user_id)
  end
  def dislike_params
    params.require(:dislike).permit(:tag_id, :user_id)
  end
end
