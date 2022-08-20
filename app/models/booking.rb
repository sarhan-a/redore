class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  belongs_to :collection_date

  validates_presence_of :collection_date_id
end
