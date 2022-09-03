class UsersController < ApplicationController
  def show
    @listings = Listing.all
  end
end
