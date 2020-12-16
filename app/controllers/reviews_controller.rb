class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_strong_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_strong_params
    params.require(:review).permit(:content, :rating)
  end
end
