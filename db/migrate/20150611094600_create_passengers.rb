class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
