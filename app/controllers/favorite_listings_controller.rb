class FavoriteListingsController < ApplicationController
  before_action :set_listing, only: %i[create destroy]
  before_action :add_index_breadcrumb, only: %i[index]

  def index
    @favorites = current_user.favorite_listings
    add_breadcrumb('Favourites')
  end

  def create
    if Favorite.create(favorited: @listing, user: current_user)
      redirect_to listing_path(@listing), notice: 'Company saved to your favourites'
    else
      redirect_to listing_path(@listing), alert: 'Something went wrong...'
    end
  end

  def destroy
    Favorite.where(favorited_id: @listing.id, user_id: current_user.id).first.destroy
    redirect_to listing_path(@listing), notice: 'Company removed from your favourites'
  end

  def clear_all
    Favorite.where(user_id: current_user.id).destroy_all
    redirect_to favorite_listings_path, notice: 'All favourites removed!'
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id] || params[:id])
  end
end
