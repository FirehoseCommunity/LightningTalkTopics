class AdminController < ApplicationController

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    u = @user
    u.toggle!(:admin)
    redirect_to admin_index_path
  end

end
