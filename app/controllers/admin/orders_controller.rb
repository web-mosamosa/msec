class Admin::OrdersController < ApplicationController
	def index
		@range = params[:range].to_i
		if @range == 1
			range = Date.today.beginning_of_day..Date.today.end_of_day
           @orders = Order.where(created_at: range)
       else
       	@orders = Order.all
       end
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
    if @order.order_status == "入金確認"
    	@order.order_items.update(make_status:"制作待ち")
    end
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