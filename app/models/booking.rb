class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :passenger
  accepts_nested_attributes_for :passenger

  has_many :tickets

  validates :trip_id, presence: true
  validate :one_per_trip_and_passenger

  enum status: %i[new confirmed cancelled], _prefix: :status

  def one_per_trip_and_passenger
    if Booking.where(passenger_id: passenger_id, trip_id: trip_id).exists?
      errors.add(:passenger_id, "with name #{ Passenger.find(passenger_id).name } already booked on this trip")
    end
  end

  def total_cost
    if self.extra_luggage?
      self.trip.bus.seat_price + 7.00
    else
      self.trip.bus.seat_price
    end
  end
end
