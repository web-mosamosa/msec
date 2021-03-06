class CartsController < ApplicationController
  def index
    @carts = Cart.all 
    @cart = Cart.where(user_id: current_user.id)
  end

  def create
    @carts = Cart.all
    flag = 0
    
    a = params[:cart].permit(:item_id,:count).to_h
    @carts.each do |cart|
     
      if cart.item_id == a[:item_id].to_i
        flag = cart.id
      end
    end
   
    if flag == 0
    
    
      cart = Cart.new(cart_params)
      cart.user_id = current_user.id
    else
     
      cart = Cart.find(flag)
      cart.count += a[:count].to_i
    end
    cart.save

    # if current_user.cart
    # cart.save
      redirect_to carts_path
  end

  def destroy_item
    cart.item.destroy
    redirect_to carts_path
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
      if @cart.save
        redirect_to carts_path(@cart)
        else
        render :index
      end
  end

  

  def destroy_all
    @user = current_user
    @user.carts.destroy_all
    
      flash[:notice] = "You have  delete carts successfully."
      redirect_to carts_path
  end
  
 
  private

  def cart_params
    params.require(:cart).permit(:count, :item_id, :user_id)
  end 
    
end
