class CartController < ApplicationController
  def show
    @cart_items = []
    if session[:cart]
      session[:cart].each do |product_id, quantity|
        product = Product.find_by(id: product_id)
        @cart_items << { product: product, quantity: quantity } if product
      end
    end
  end
end