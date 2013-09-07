class LocalitiesController < ApplicationController
  def index
    @localities = Locality.all
    @total_localities = Locality.all.count
    @total_users = User.all.count
  end

  def show
    @locality = Locality.find_by(name: params[:name])
  end
end
