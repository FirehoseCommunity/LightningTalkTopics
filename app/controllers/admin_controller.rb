class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

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

  private

  def is_admin?
    unless current_user && current_user.admin?
      redirect_to root_path, :flash => { :alert => "Need to be an Admin to access this page."}
    end
  end

end
