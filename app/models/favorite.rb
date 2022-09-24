class Favorite < ApplicationRecord
  validates :user_id, uniqueness: { scope: %i[favorited_id favorited_type] }
  belongs_to :user
  belongs_to :favorited, polymorphic: true
end
