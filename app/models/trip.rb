class Trip < ApplicationRecord
  include Filterable

  belongs_to :bus, class_name: 'Bus'
  belongs_to :departure, class_name: 'City'
  belongs_to :arrival, class_name: 'City'

  has_many :bookings

  validates :departure_id, presence: true
  validates :arrival_id, presence: true
  validates :departure_date, presence: true
  validates :bus_id, uniqueness: { scope: [ :arrival_id, :departure_date ] }
  validates :booked_seats, presence: true
  validate  :different_cities

  scope :filter_by_departure, -> (departure) { where departure: departure }
  scope :filter_by_arrival, -> (arrival) { where arrival: arrival}
  scope :filter_by_departure_date, -> (departure_date) { where("departure_date >= ?", departure_date) }

  def price
    self.bus.seat_price
  end

  def extra_luggage?
    self.bus.extra_luggage?
  end

  def available_seats
    self.bus.seats - self.booked_seats
  end

  def self.update_booked_seats(trip)
    trip = Trip.find(trip)
    trip.booked_seats += 1
    trip.save
  end

  private

  def different_cities
    if departure_id == arrival_id
      errors.add(:arrival_id, 'must be different from departure city')
    end
  end
end
