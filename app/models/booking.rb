class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates_presence_of :collection_date
end
