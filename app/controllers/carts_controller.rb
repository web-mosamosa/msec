class CartsController < ApplicationController
  def index
    @cart = Cart.where(user_id: current_user.id)
  end

  def create
    cart = Cart.new(cart_params)
    cart.user_id = current_user.id
    cart.save
      redirect_to carts_path
  end

  def destroy
    @cart = Cart.find(params[:id]) #データ(レコード)を1件取得
    cart.destroy
    redirect_to cart_path
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
      if @cart.save
        redirect_to cart_path(@cart)
        else
        render :index
      end
  end

  

  def destroy_all
  end

  private
    def cart_params
        params.require(:cart).permit(:count, :item_id, :user_id,)
    end
  
end