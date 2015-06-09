class AddDateToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :date, :datetime
  end
end
