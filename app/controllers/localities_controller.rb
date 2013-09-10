class LocalitiesController < ApplicationController
  def index
    @localities = Locality.all
    @total_localities = Locality.all.count
    @total_users = User.all.count
    @total_hanged_tags = Hantagace.all.count
  end

  def show
    @locality = Locality.find_by(name: params[:name])
  end
  
  def hantagace
    locality = Locality.find(params[:id])
    locality.update_attributes!(hantagace_params)
    redirect_to root_url #should stay in same page
  end
  
  private
  
  def hantagace_params
    params.require(:locality).permit(:locality_id, { tag_ids: [] })
  end
end
