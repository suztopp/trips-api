class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.datetime :start
      t.datetime :end
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
