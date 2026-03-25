class SearchController < ApplicationController
  def index
    @query = params[:query]
    @category_id = params[:category_id]
    @categories = Category.all

    @products = Product.all

    if @query.present?
      @products = @products.where("name ILIKE ? OR description ILIKE ?", "%#{@query}%", "%#{@query}%")
    end

    if @category_id.present?
      @products = @products.joins(:product_categories).where(product_categories: { category_id: @category_id })
    end
  end
end