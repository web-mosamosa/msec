class CategoriesController < ApplicationController
  def index
  	@category = Category.all
  	@new_categories = Category.new
  	
  end

  def edit
  	@categories = Category.find(params[:id])
  end
  def create
  	@categories = Category.all
  	@category = Category.new(category_params)

  	 @category.save
      redirect_to categories_path(@categories)
  end
 

  def update
  	@category = Category.find(params[:id])
        @category.update(category_params)
        if @category.save
          redirect_to categories_path(@category.id)
           else
          render :edit
        end

  end
   private
    def category_params
      params.require(:category).permit(:name, :status)
    end
end
