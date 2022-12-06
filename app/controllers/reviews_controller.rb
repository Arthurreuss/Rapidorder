class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # def new
  #   @product = Product.find(params[:product_id])
  #   @review = Review.new
  # end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end
end
