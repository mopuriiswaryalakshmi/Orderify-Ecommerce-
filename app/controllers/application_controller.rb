class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller? 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, addresses_attributes: [:id,:street,:pin_code,:city]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(user)
  	if user.sign_in_count == 30
  		edit_user_registration_path
  	else
  	  root_path
  	 end
  	end

  rescue_from CanCan::AccessDenied do 
  	redirect_to root_path, notice: "Not Authorized"
  end
end
