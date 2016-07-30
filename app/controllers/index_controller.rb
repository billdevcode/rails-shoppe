class IndexController < ApplicationController
  before_action :set_categories
  before_action :require_login
  skip_before_action :require_login, only: [:index]


  def index
  end

  def admin
    @products = Product.all
  end

  private

  def set_categories
    @categories = Category.all
  end
end
