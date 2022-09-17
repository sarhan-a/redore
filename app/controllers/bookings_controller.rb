class BookingsController < ApplicationController
  before_action :add_index_breadcrumb, only: %i[index show new edit]

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.new(user: current_user)
    @bookings = @listing.bookings
                        .where('collection_date >= ? AND collection_date < ?', Time.current, Time.current + 90.days)
                        .order(collection_date: :asc)
    @booked_dates = @bookings.pluck(:collection_date)
    add_breadcrumb(@listing.title, listing_path(@listing))
    add_breadcrumb('Book now')
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
    @listing = Listing.find(params[:listing_id])
    add_breadcrumb(@booking.listing.title, listing_path(@booking.listing))
    add_breadcrumb('Your booking')
  end

  def index
    @listing = Listing.find(params[:listing_id])
    @bookings = @listing.bookings
    add_breadcrumb(@listing.title, listing_path(@listing))
    add_breadcrumb('Bookings')
  end

  private

  def booking_params
    params.require(:booking).permit(:collection_date)
  end
end
