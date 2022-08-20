class AddCollectionDateId < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :collection_date, foreign_key: true
  end
end
