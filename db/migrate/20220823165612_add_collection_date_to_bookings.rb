class AddCollectionDateToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :collection_date, :date
  end
end
