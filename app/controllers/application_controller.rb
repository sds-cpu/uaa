class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :configure_permitted_parameters, if: :devise_controller?

  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    else
      dashboard_path
    end
  end

  protected

  def configure_permitted_parameters
    # Permit custom fields for sign up and account update
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :profile_photo, :phone, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :profile_photo, :phone, :address])
  end
  def after_update_path_for(resource)
    profile_path(resource)  # Redirect to the profile page after update
  end
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
