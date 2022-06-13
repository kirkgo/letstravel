class Booking < ApplicationRecord
  belongs_to :trip
  belongs_to :passenger
  accepts_nested_attributes_for :passenger

  has_many :tickets

  validates :trip_id, presence: true, on:  :create
  validate :one_per_trip_and_passenger, on: :create
  validate :available_seat?, :time_for_booking?, on: :create

  enum status: %i[reserved cancelled], _prefix: :status

  def one_per_trip_and_passenger
    if Booking.where(passenger_id: passenger_id, trip_id: trip_id).exists?
      errors.add(:passenger_id, "with name #{ Passenger.find(passenger_id).name } already booked on this trip")
    end
  end

  def available_seat?
    if self.trip.available_seats == 0
      errors.add(:no_available, " seat, this trip is full.")
    end
  end

  def time_for_booking?
    if DateTime.now > self.trip.departure_date - 30.minutes
      errors.add(:cannot_book, " because this trip will depart in 30 minutes or less.")
    end
  end

  def price
    if self.extra_luggage?
      self.trip.bus.seat_price + 7.00
    else
      self.trip.bus.seat_price
    end
  end
end
