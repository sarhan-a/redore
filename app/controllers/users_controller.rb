class UsersController < ApplicationController
  def show
    @bookings = current_user.bookings
    add_breadcrumb('Your bookings')
  end
end
