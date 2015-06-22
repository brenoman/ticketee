class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!
  def index
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created."
      render :action => "new"
    end
  end
end