class UsersController < ApplicationController



  def withdraw
    @user = User.find(params[:id])
  end
  def residence
    @residence = Residence.new
    @user = User.find(params[:id])
    @residences = @user.residences

  end
  def show
  	@user = User.find(params[:id])
  end


  def edit
	@user = User.find(params[:id])
  end

  def update
	 @user = User.find(params[:id])
   @user.update(user_params)
   @user.save
      if @user_status == "uraura_withdraw"
           redirect_to user_path(@user.id)
      else 
           redirect_to destroy_user_session_path
      end
 end

 
  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone_number, :email, :user_status,:password,:password_confirmation)
  end
end

