class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @q = Listing.ransack(params[:q])
    @listings = @q.result(distinct: true)
  end
end
