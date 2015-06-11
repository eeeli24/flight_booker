class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :num_of_passengers
      t.references :flight, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
