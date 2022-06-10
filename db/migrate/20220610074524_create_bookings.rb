class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :passenger, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
