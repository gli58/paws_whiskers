class ProductsController < ApplicationController
  def index
    @products = Product.includes(:categories).all

    if params[:search].present?
      @products = @products.where("products.name LIKE ? OR products.description LIKE ?",
                                   "%#{params[:search]}%",
                                   "%#{params[:search]}%")
    end

    if params[:category_id].present?
      @products = @products.joins(:categories).where(categories: { id: params[:category_id] })
    end

    @products = @products.on_sale if params[:on_sale]
    @products = @products.new_arrivals if params[:new]
    @products = @products.recently_updated if params[:recently_updated]

    @products = @products.distinct.page(params[:page]).per(12)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
