class UsersController < ApplicationController
  def index
    @background = random_bg
  end
  
  def show
    if current_user
      @user = User.find_by_id(params[:id])
    else
      redirect_to root_url
    end
  end
  
  private
  
  def random_bg
    blacklist = [".", "..",".DS_Store"]
    file_names = Dir.entries("#{Rails.root}/app/assets/images/bg-fullscreen/")
    blacklist.each do |blacklsited|
      file_names.delete(blacklsited)
    end
    "bg-fullscreen/#{file_names.shuffle.first}"
  end
end