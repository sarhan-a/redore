class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @listings = Listing.all
  end


  def show
    @listing = Listing.find(params[:id])
  end
  
  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :address, :details, :price)
   end
end
