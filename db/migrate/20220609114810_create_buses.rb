class CreateBuses < ActiveRecord::Migration[6.1]
  def change
    create_table :buses do |t|
      t.string :bus_code
      t.boolean :extra_luggage, default: false
      t.integer :seats
      t.decimal :seat_price, :decimal, precision: 5, scale: 2

      t.timestamps
    end
  end
end
