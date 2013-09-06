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
    begin
      @locality = Locality.find_or_create_by(name: check_in_params[:locality_name])
      @check_in = CheckIn.create(locality_id: @locality.id, user_id: check_in_params[:user_id])
      redirect_to root_url
    rescue ActiveRecord::RecordNotUnique
      render '/public/500', layout: false
    end
  end
  
  def current_user_check_ins
    # get name (locality) of all current user check ins
    @current_user_check_ins = Locality.joins(:check_ins).where(check_ins: { user_id: current_user.id }).pluck(:name)
    respond_to do |format|
      format.json { render :json => @current_user_check_ins }
    end
  end
  
  private
  
  def check_in_params
    params.require(:check_in).permit(:locality_id, :user_id, :locality_name)
  end
  
  def locality_params
    params.require(:locality).permit(:name)
  end
end