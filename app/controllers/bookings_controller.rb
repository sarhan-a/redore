class BookingsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @collection_date = CollectionDate.find(params[:collection_date_id])
    @booking = @listing.bookings.new(user: current_user)
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.new(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to listing_booking_path(@listing, @booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @listing = Listing.find(params[:listing_id])
    @bookings = @listing.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:collection_date_id)
  end
end
