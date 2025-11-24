class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    if @cart.empty?
      redirect_to cart_path, alert: "Your cart is empty"
      return
    end

    unless current_user.province
      redirect_to edit_user_registration_path, alert: "Please complete your address information"
      return
    end

    @order = Order.new
    @cart_items = []
    @subtotal = 0

    @cart.each do |product_id, quantity|
      product = Product.find(product_id)
      item_total = product.current_price * quantity
      @subtotal += item_total
      @cart_items << { product: product, quantity: quantity, item_total: item_total }
    end

    province = current_user.province
    @gst = @subtotal * (province.gst_rate / 100)
    @pst = @subtotal * (province.pst_rate / 100)
    @hst = @subtotal * (province.hst_rate / 100)
    @total = @subtotal + @gst + @pst + @hst
  end

  def create
    @order = current_user.orders.build
    @order.status = "pending"
    @order.province = current_user.province

    subtotal = 0
    @cart.each do |product_id, quantity|
      product = Product.find(product_id)
      @order.order_items.build(
        product: product,
        quantity: quantity,
        price_at_purchase: product.current_price
      )
      subtotal += product.current_price * quantity
    end

    province = current_user.province
    @order.subtotal = subtotal
    @order.gst_amount = subtotal * (province.gst_rate / 100)
    @order.pst_amount = subtotal * (province.pst_rate / 100)
    @order.hst_amount = subtotal * (province.hst_rate / 100)
    @order.total_amount = subtotal + @order.gst_amount + @order.pst_amount + @order.hst_amount

    if @order.save
      session[:cart] = {}
      redirect_to order_path(@order), notice: "Order placed successfully!"
    else
      render :new
    end
  end

  private

  def initialize_cart
    @cart = session[:cart] ||= {}
  end
end
