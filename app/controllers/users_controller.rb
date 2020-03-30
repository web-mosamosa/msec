class UsersController < ApplicationController
  def show
    @user = User.find
    
  end

end
