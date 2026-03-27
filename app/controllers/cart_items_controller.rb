class CartItemsController < ApplicationController
  def create
    cart = session[:cart] ||= {}
    product_id = params[:product_id].to_s
    cart[product_id] = (cart[product_id] || 0) + params[:quantity].to_i
    session[:cart] = cart
    flash[:notice] = "Item added to cart."
    redirect_to cart_path
  end

  def update
    cart = session[:cart] ||= {}
    product_id = params[:id].to_s
    cart[product_id] = params[:quantity].to_i
    session[:cart] = cart
    redirect_to cart_path
  end

  def destroy
    cart = session[:cart] ||= {}
    cart.delete(params[:id].to_s)
    session[:cart] = cart
    redirect_to cart_path
  end
end
