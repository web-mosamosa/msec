# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

   before_action :configure_sign_in_params, only: [:create]  
   before_action :reject_user, only: [:create]
   #GET /resource/sign_in
   def new
     super
   end

   #POST /resource/sign_in
   def create
     super
   end

   #DELETE /resource/sign_out
   def destroy
     super
   end

   protected

   #If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   end

   def reject_user
    @user_status = User.find_by(email: params[:user][:email]).user_status
    
    if @user_status == "退会済み"
         flash[:error] = "退会済みです。"
         redirect_to root_path   
        
    end
 end

end
