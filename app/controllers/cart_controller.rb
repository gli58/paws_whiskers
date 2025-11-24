class CartController < ApplicationController
  before_action :initialize_cart

  def show
    @cart_items = []
    @subtotal = 0

    @cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product

      item_total = product.current_price * quantity
      @subtotal += item_total
      @cart_items << { product: product, quantity: quantity, item_total: item_total }
    end
  end

  def add
    product = Product.find(params[:product_id])
    @cart[product.id.to_s] ||= 0
    @cart[product.id.to_s] += 1
    session[:cart] = @cart

    redirect_to cart_path, notice: "#{product.name} added to cart"
  end

  def remove
    product_id = params[:product_id]
    @cart.delete(product_id)
    session[:cart] = @cart

    redirect_to cart_path, notice: "Item removed from cart"
  end

  def update_quantity
    product_id = params[:product_id]
    quantity = params[:quantity].to_i

    if quantity > 0
      @cart[product_id] = quantity
    else
      @cart.delete(product_id)
    end

    session[:cart] = @cart
    redirect_to cart_path
  end

  def clear
    session[:cart] = {}
    redirect_to root_path, notice: "Cart cleared"
  end

  private

  def initialize_cart
    @cart = session[:cart] ||= {}
  end
end
