class ProductsController < ApplicationController
  def index
    @products = Product.all
    session[:last_visited] = "products"
  end

  def show
    @product = Product.find(params[:id])
    flash.now[:notice] = "Viewing #{@product.name}"
  end
end