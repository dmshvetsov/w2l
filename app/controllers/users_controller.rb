class UsersController < ApplicationController
  def index
    @check_in = CheckIn.new
  end
  
  def show
    if current_user
      @user = User.find_by_id(params[:id])
    else
      redirect_to root_url
    end
  end
  
  def check_in
    @locality = Locality.find_or_create_by(name: check_in_params[:locality_name])
    @check_in = CheckIn.create(locality_id: @locality.id, user_id: check_in_params[:user_id])
    #respond_to do |format|
    #  format.html { redirect_to root_url }
    #  format.js
    #end
    redirect_to root_url
  end
  
  private
  
  def check_in_params
    params.require(:check_in).permit(:locality_id, :user_id, :locality_name)
  end
  
  def locality_params
    params.require(:locality).permit(:name)
  end
end