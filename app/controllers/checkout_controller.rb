class CheckoutController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_cart_not_empty

  def index
    @cart_items = build_cart_items
    @province = current_user.province || Province.first
    @subtotal = @cart_items.sum { |i| i[:line_total] }
    calculate_taxes(@province, @subtotal)
    @grand_total = @subtotal + @gst_amount + @pst_amount + @hst_amount
  end

  def create
    @cart_items = build_cart_items
    province = current_user.province || Province.find_by(id: params[:province_id])

    subtotal = @cart_items.sum { |i| i[:line_total] }
    gst = (subtotal * province.gst_rate).round(2)
    pst = (subtotal * province.pst_rate).round(2)
    hst = (subtotal * province.hst_rate).round(2)
    grand_total = subtotal + gst + pst + hst

    order = Order.new(
      user: current_user,
      province: province,
      status: "new",
      subtotal: subtotal,
      gst_amount: gst,
      pst_amount: pst,
      hst_amount: hst,
      grand_total: grand_total,
      shipping_address: current_user.address
    )

    @cart_items.each do |item|
      order.order_items.build(
        product: item[:product],
        product_name: item[:product].name,
        unit_price: item[:unit_price],
        quantity: item[:quantity],
        line_total: item[:line_total],
        gst_rate_snapshot: province.gst_rate,
        pst_rate_snapshot: province.pst_rate,
        hst_rate_snapshot: province.hst_rate
      )
    end

    if order.save
      session[:cart] = {}
      flash[:notice] = "Order placed successfully."
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to checkout_path
    end
  end

  private

  def build_cart_items
    items = []
    (session[:cart] || {}).each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product
      unit_price = product.on_sale && product.sale_price ? product.sale_price : product.price
      items << {
        product: product,
        quantity: quantity,
        unit_price: unit_price,
        line_total: (unit_price * quantity).round(2)
      }
    end
    items
  end

  def calculate_taxes(province, subtotal)
    @gst_amount = (subtotal * province.gst_rate).round(2)
    @pst_amount = (subtotal * province.pst_rate).round(2)
    @hst_amount = (subtotal * province.hst_rate).round(2)
  end

  def ensure_cart_not_empty
    if session[:cart].blank?
      flash[:alert] = "Your cart is empty."
      redirect_to products_path
    end
  end
end