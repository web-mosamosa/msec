class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category =Category.find(params[:id])
    @items = @category.items
  end
   private
    def category_params
      params.require(:category).permit(:name, :status)
    end
end
