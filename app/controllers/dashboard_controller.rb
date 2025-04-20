class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      redirect_to admin_dashboard_path and return
    end
  end
end
