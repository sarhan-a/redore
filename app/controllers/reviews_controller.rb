class ReviewsController < ApplicationController
  before_action :set_listing

  def new
    @review = Review.new
    add_breadcrumb(@listing.title, listing_path(@listing))
    add_breadcrumb('Add a review')
  end

  def create
    @review = Review.new(review_params)
    @review.listing = @listing
    @review.user = current_user
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
