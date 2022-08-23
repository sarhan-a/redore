class DropCollectionDatesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :collection_dates
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
