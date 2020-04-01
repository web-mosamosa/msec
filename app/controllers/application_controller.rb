class ApplicationController < ActionController::Base
  helper_method :current_cart
  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
  def after_sign_in_path_for(resource)
  case resource
  when User
    user_path(resource)
  when Admin
    admin_top_path
  end
end


  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name_kana,:last_name_kana,:email,:password,:profile_image_id,:postcode,:address,:phone_number,:user_status])
  end
end
