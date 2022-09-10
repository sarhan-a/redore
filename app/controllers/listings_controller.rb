class ListingsController < ApplicationController
  before_action :find_listing, only: %i[show edit update destroy]
  before_action :add_index_breadcrumb, only: %i[show new edit]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @q = Listing.ransack(params[:q])
    @listings = @q.result(distinct: true)
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window: render_to_string(partial: "popup", locals: {listing: listing})
      }
    end
    add_breadcrumb('Listings')
  end

  def show
    add_breadcrumb(@listing.title)
  end

  def new
    @listing = Listing.new
    add_breadcrumb('New')
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb('Edit')
  end

  def update
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :address, :details, :price, photos: [])
  end

  def add_index_breadcrumb
    add_breadcrumb('Listings', listings_path)
  end
end
