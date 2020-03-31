class CartsController < ApplicationController
  def index

    @cart = Cart.new
    @carts = Cart.all
    @items = Item.all
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

  def create
    @cart = Cart.new(cart_params)
    @cart.save
      redirect_to cart_path(@cart)
      

  end




  def create
  	
  end

  def dedtroy
  	
  end
  private
   
    def cart_params
        params.require(:cart).permit(:count, :item_id, :user_id,)
    end
  
end

