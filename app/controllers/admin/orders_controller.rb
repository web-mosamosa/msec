class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end
	def userindex
		@user = User.find(params[:id])
		@orders =@user.orders
	end

	def show
		@order = Order.find(params[:id])
		@order_item = @order.order_items
		@user = @order.user_id
	end

	def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order.save
    redirect_back(fallback_location: root_path)
    end


private
def order_params
	params.require(:order).permit(:id, :order_status)
end

def order_item_params
	params.require(:order_item).permit(:order_id, :make_status)
end
end