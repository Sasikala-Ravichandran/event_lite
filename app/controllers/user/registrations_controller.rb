class User::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  protected 

  def after_sign_up_path_for(resource)
    session.delete(:return_to) || current_user
  end
   
  def after_update_path_for(resource)
    current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
    devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name)
  end

end