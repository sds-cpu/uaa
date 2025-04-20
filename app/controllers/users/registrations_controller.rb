class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :profile_photo, :phone, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :profile_photo, :phone, :address])
  end

  def update_resource(resource, params)
    params.delete(:current_password)  # Important!
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    flash[:notice] = "Profile updated successfully!"
    profile_path
  end

  public

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?

    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
