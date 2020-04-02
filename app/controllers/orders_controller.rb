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
    	if params[:address_select] == "1"
            @order = Order.new
            @order.postcode = current_user.post_code
            @order.address = current_user.address
            @order.order_name = current_user.last_name+first_name
            @order.pay = params[:order][:pay].to_i

        elsif params[:address_select] == "2"
            @address = Residence.find(params[:order][:address_id])
            @order = Order.new
            @order.postcode = @residence.postcode
            @order.address = @residence.address
            @order.order_name = @residence.name
            @order.pay = params[:order][:pay].to_i
        else
            postcode = params[:order][:postcode]
            address = params[:order][:address]
            order_name = params[:order][:order_name]
            if  postcode == "" || address == "" || order_name == ""
            redirect_to new_users_order_path
            else
            @order = Order.new(order_params)
            end
        end
    end
    private
    def order_params
    	params.require(:order).permit(:postcode,:address,:order_name,:pay,:total_amount,:order_status)
    end
end
