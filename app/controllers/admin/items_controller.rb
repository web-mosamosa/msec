class Admin::ItemsController < ApplicationController
  def top 
  end

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end


  def edit
  end


private

  def item_params
    params.require(:item).permit(:name, :text, :price, :sell_status)
  end


end
