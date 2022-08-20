class CollectionDatesController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @collection_date = @listing.collection_dates.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @collection_date = @listing.collection_dates.new(collection_date_params)
    @collection_date.save
    redirect_to listing_collection_date_path(@listing, @collection_date)
  end

  def show
    @collection_date = CollectionDate.find(params[:id])
  end

  def index
    @listing = Listing.find(params[:listing_id])
    @collection_dates = @listing.collection_dates
  end

  private

  def collection_date_params
    params.require(:collection_date).permit(:date)
  end
end
