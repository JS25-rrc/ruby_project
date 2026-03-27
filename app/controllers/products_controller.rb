class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.on_sale if params[:filter] == "on_sale"
    @products = @products.new_arrivals if params[:filter] == "new"
    @products = @products.recently_updated if params[:filter] == "recently_updated"
    session[:last_visited] = "products"
  end

  def show
    @product = Product.find(params[:id])
    flash.now[:notice] = "Viewing #{@product.name}"
  end
end