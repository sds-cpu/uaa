class HomeController < ApplicationController
  before_action :authenticate_user!  # Make sure the user is logged in

  def index
    if current_user.admin?
      # If the user is an admin, show the admin dashboard
      @users = User.all  # Example of listing all users
    else
      # If the user is not an admin, show the user dashboard
      @profile = current_user.profile
    end
  end
end
