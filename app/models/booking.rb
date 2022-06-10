class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :passenger
  accepts_nested_attributes_for :passenger

  validates :trip_id, presence: true
  validates :passenger_id, presence: true
  validate :one_per_trip_and_passenger

  def one_per_trip_and_passenger
    if Booking.where(passenger_id: passenger_id, trip_id: trip_id).exists?
      errors.add(:passenger_id, "with name #{ Passenger.find(passenger_id).name } already booked on this trip")
    end
  end
end
