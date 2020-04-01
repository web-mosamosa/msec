class ItemsController < ApplicationController

def top
end

  def index
  	@categories = Category.all
    # urlにcategory_id(params)がある場合
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
       
      # category_idと紐づく投稿を取得
      @items = @category.items.order(created_at: :desc).all
    else
      # 投稿すべてを取得
      @items = Item.order(created_at: :desc).all
    end
  end

  def show
    @item = Item.find(params[:id])
  end

private

  def item_params
    params.require(:item).permit(:cart_id)
  end

end