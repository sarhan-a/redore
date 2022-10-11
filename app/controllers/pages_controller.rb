class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]

  def home
    @q = Listing.ransack(params[:q])
    @listings = @q.result(distinct: true)
  end

  def about
    add_breadcrumb('About')
  end

  def brands
    add_breadcrumb('Which brands?')
  end

  def facts
    add_breadcrumb('Hard facts')
  end

  def help
    add_breadcrumb('Help')
  end

  def live_sustainably
    add_breadcrumb('Sustainable life')
  end

  def error
  end
end
