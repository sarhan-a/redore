class CollectionDate < ApplicationRecord
  belongs_to :listing
  has_many :bookings, dependent: :destroy

  validates_presence_of :date
end
