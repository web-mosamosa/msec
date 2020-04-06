class UsersController < ApplicationController



  def withdraw
    @user = User.find(params[:id])
<<<<<<< HEAD
<<<<<<< HEAD
 end
=======
  end

>>>>>>> 064c55c3555e3e0477cf29252aadb1c3238d49de
=======
 end

>>>>>>> 040d64a18138b314d2c612d3f70bbfa45889b829
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
           redirect_to root_path   
      end
 end

 
  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :residence, :phone_number, :email, :user_status,:password,:password_confirmation)
  end
end

