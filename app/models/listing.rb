class Listing < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  has_many :collection_dates, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates_presence_of :title, :address, :details, :price
  validates :price, numericality: true

  def average_rating
    if reviews.size.positive?
      reviews.average(:rating)
    else
      'No ratings yet'
    end
  end
end
