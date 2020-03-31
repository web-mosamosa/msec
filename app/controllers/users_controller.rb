class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
		
  end

  def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
    redirect_to user_path(current_user)
	  end
	end

  def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "You have updated user successfully."
  		redirect_to user_path(@user.id)
  	else
  		render "edit"
  	end
  end
	

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :residence, :phone_number, :email)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。

	

	def correct_user
		@user = User.find(id: params[:id])
			unless @user
				redirect_to new_user_session
			end
	end
end
  

