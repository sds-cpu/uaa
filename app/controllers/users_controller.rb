class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  load_and_authorize_resource except: [:profile]# This is fine as it will automatically load @user

  def profile
    @user = current_user  # This will show the current logged-in user's profile
    authorize! :read, @user # This will show the current logged-in user's profile
  end

  def show
    authorize! :read, @user
  end

  def edit
    # @user will be set by set_user before_action
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated."
    else
      render :edit
    end
  end

  private

  def set_user
    # This is fine for actions like `show`, `edit`, and `update`
    @user = current_user
  end

  def user_params
    # Customize the permitted parameters
    permitted = [:full_name, :phone, :address, :avatar]
    permitted << :role if current_user.admin? # Only allow the `role` parameter if the user is an admin
    params.require(:user).permit(permitted)
  end
end
