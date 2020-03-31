class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

  def edit
	@user = User.find(params[:id])
  end

  def update
	@user = User.find(params[:id])

	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :residence, :phone_number, :email)
  end
end

