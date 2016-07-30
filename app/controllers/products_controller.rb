class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  before_action :require_login
  skip_before_action :require_login, only: [:show]

  def show
    @order = Order.new()
  end

  def new
    @product = Product.new()
    @catalog = @product.catalogs.new()
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save && params.require(:category).any?
      @product.update(img: "http://www.pintywptheme.com/wp-content/uploads/2014/12/no-image-placeholder.png") if @product.img == ""
      params.require(:category).each do |id|
        @product.catalogs.create(category_id: id.to_i)
      end
      flash[:success] = "New product created!"
      redirect_to product_path(@product)
    else
      flash[:danger] = "Unsuccessful creation"
      @categories = Category.all
      render 'new'
    end
  end

  def update
    if @product.update(product_params) && params.require(:category).any?
      Catalog.where(product_id: @product.id).destroy_all
      params.require(:category).each do |id|
        @product.catalogs.create(category_id: id.to_i)
      end
      flash[:success] = "Product updated"
      redirect_to product_path(@product)
    else
      flash[:danger] = "Unsuccessful update"
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to '/admin'
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :remaining_qty, :img)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
