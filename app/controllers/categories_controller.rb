class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.update(category_params)[0]
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to categories_path
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end
end
