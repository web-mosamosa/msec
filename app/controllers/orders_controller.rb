class OrdersController < ApplicationController
  def new
    	@order = Order.new
    end

    def index
    end

    def show
    	@order = Order.find(params[:id])
    	@order.user_id = current_user.id
    end


    def confirm
        @cart = current_user.carts
        @order = Order.new(order_params)
        @order.pay = params[:order][:pay]
        @total_amount = params[:order][:total_amount]
    	if params[:select] == "1"
            @order.postcode = current_user.postcode
            @order.address = current_user.address
            @order.order_name = current_user.last_name

        elsif params[:select] == "2"
            @residence = Residence.find(params[:order][:residence_id])
            @order.postcode = @residence.postcode
            @order.address = @residence.address
            @order.order_name = @residence.name
        else
            postcode = params[:order][:postcode]
            address = params[:order][:address]
            order_name = params[:order][:order_name]
        end
    end

    def create
    	@order = Order.new(order_params)
        @order.user_id = current_user.id
    	@order.save

        current_user.carts.each do |cart|
        @order_item = OrderItem.new
        @order_item.item_id = cart.item_id
        @order_item.price = cart.item.price * 1.1
        @order_item.order_count = cart.count
        @order_item.order_id = @order.id
        @order_item.save
        end
        current_user.carts.destroy_all
        redirect_to users_homes_thanks_path
   end

    

    private
    def order_params
    	params.require(:order).permit(:postcode,:address,:order_name,:pay,:total_amount,:order_status)
    end
end
