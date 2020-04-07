class Admin::OrderItemsController < ApplicationController

def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    @order_item.save

    if @order_item.make_status == "制作中"
    	@order.update(order_status:"制作中")
    else
    	@order_item.make_status == "制作完了"
    	@order.update(order_status:"発送準備中")
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