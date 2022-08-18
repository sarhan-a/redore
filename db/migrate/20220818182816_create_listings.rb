class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :address
      t.text :details
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
