class BookingsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.new(user: current_user)
    @bookings = Booking.where('collection_date >= ? AND collection_date < ?', Time.current, Time.current + 90.days).order(collection_date: :asc)
    @booked_dates = @bookings.pluck(:collection_date)
  end

  def create
    @listing = Listing.find(params[:listing_id])
    date = Date.strptime(booking_params[:collection_date], '%Y-%m-%d')
    @booking = Booking.new(listing: @listing, user: current_user, collection_date: date)
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
    params.require(:booking).permit(:collection_date)
  end
end
