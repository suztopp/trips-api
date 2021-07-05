class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :country
      t.integer :length

      t.timestamps
    end
  end
end
