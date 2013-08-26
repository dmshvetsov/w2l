class UsersController < ApplicationController
  def index
  end
  
  def show
    if current_user
      @user = User.find_by_id(params[:id])
    else
      redirect_to root_url
    end
  end
end