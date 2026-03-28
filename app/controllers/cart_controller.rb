class CartController < ApplicationController
  def show
    @cart_items = []
    if session[:cart]
      session[:cart].each do |product_id, quantity|
        product = Product.find_by(id: product_id)
        next unless product
        unit_price = product.on_sale? && product.sale_price ? product.sale_price : product.price
        @cart_items << {
          product: product,
          quantity: quantity,
          unit_price: unit_price,
          line_total: (unit_price * quantity).round(2)
        }
      end
    end
  end
end