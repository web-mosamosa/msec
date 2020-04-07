class Admin::ItemsController < ApplicationController
  def top
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
  end

  def index
    @items = Item.all

  end

  def show
    @item = Item.find(params[:id])
    @tax_price = ((@item.price.to_i * 1.1).round(2)).ceil.to_i
  end

  def new
  	@item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item)
  else
    render :index
  end
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    redirect_to admin_item_path(@item)
  end




private

  def item_params
    params.require(:item).permit(:name, :text, :price, :sell_status, :category_id, :profile_image, :range)
  end


end
