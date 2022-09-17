class UsersController < ApplicationController
  def show
    @bookings = current_user.bookings
    add_breadcrumb('My bookings')
  end
end
