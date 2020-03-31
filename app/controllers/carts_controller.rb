class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
  
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
  
  def show
    @cart_items = current_cart.cart_items
  end

  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end
  
  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end
  
  private
   
    def cart_params
        params.require(:cart).permit(:count, :item_id, :user_id,)
    end
    
    def setup_cart_item!
      @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
    end

end

