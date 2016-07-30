class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:show]

  def show
    @order = Order.new()
  end

  def new
    @category = Category.new()
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "New category created!"
      redirect_to @category
    else
      flash[:danger] = "Unsuccessful creation"
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category updated"
      redirect_to @category
    else
      flash[:danger] = "Unsuccessful update"
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
