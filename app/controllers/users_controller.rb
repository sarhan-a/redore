class UsersController < ApplicationController
  def show
    @bookings = current_user.bookings
  end
end
