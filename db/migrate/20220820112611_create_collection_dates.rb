class CreateCollectionDates < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_dates do |t|
      t.date :date
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
