class Listing < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  validates_presence_of :title, :address, :details, :price
end
