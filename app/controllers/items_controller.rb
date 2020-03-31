class ItemsController < ApplicationController

def top
end

def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

private

  def item_params
    params.require(:item).permit(:cart_id)
  end

end