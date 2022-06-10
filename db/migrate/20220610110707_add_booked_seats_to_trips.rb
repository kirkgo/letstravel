class AddBookedSeatsToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :booked_seats, :integer, default: 0
  end
end
