class Listing < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates_presence_of :title, :address, :details, :price
  validates :price, numericality: true

  def average_rating
    reviews.average(:rating)
  end

  ransacker :collection_date, type: :date do
    Arel.sql('date(collection_date)')
  end
end
