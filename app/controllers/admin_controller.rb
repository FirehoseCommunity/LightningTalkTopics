class AdminController < ApplicationController

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    u = @user
    if ! u.admin
      u.update_attributes(admin: true)
    else
      u.update_attributes(admin: false)
    end
    redirect_to admin_index_path
  end

end
