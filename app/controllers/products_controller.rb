class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    # @reviews = Review.where(product_id: @product.id).includes(:user)
    @reviews = @product.reviews
    @review = Review.new(product_id: @product.id, user_id: current_user.id) if current_user
  end

end
