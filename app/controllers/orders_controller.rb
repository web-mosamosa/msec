class OrdersController < ApplicationController
  def new
  	@order = Order.new
  	@user = User.find(params[:user_id])
  end

  def create
  end
end
