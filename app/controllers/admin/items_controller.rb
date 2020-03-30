class Admin::ItemsController < ApplicationController
  def top
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.category_id = 1
    if @item.save
    redirect_to admin_item_path(@item)
  else
    render :index
  end
  end


  def edit
  end


private

  def item_params
    params.require(:item).permit(:name, :text, :price, :sell_status)
  end


end
