class ReviewsController < ApplicationController
  before_action :set_listing

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.listing = @listing
    if @review.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
