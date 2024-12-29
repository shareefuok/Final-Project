class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    cat_id = params[:id]
    @category = Category.find(cat_id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(cat_params)

    if @category.save
      redirect_to(categories_path)
    else
      render('new')
    end
  end

  def edit
    cat_id = params[:id]
    @category = Category.find(cat_id)
  end

  def update
    cat_id = params[:id]
    @category = Category.find(cat_id)

    if @category.update(cat_params)
      redirect_to(categories_path)
    else
      render('edit')
    end
  end

  def delete
    cat_id = params[:id]
    @category = Category.find(cat_id)
  end

  def destroy
    cat_id = params[:id]
    @category = Category.find(cat_id)

    @category.destroy
    redirect_to(categories_path)
  end


  private
  def cat_params
    params.require(:category).permit(
      :name
    )
  end
end