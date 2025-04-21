class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User updated."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_dashboard_path, notice: 'User deleted successfully.'
    else
      redirect_to admin_dashboard_path, alert: 'Error deleting user.'
    end
  end

  def promote
    @user = User.find(params[:id])
    if @user.update(role: 'admin')
      redirect_to admin_dashboard_path, notice: 'User promoted to admin.'
    else
      redirect_to admin_dashboard_path, alert: 'Error promoting user.'
    end
  end
  def demote
    if @user.update(role: 'user')
      redirect_to admin_users_path, notice: "#{@user.email} has been demoted to user."
    else
      redirect_to admin_users_path, alert: "Failed to demote user."
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    permitted = [:full_name, :email, :profile_photo, :password, :password_confirmation, :role]
    permitted << :role if current_user.admin?
    params.require(:user).permit(permitted)
  end
end
