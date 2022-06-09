class Bus < ApplicationRecord
  validates :bus_code, presence: true
  validates :bus_code, length: { minimum: 8, maxium: 8 }
  validates :seats, presence: true
  validates :seats, numericality: { in: 22..44 }
  validates :seat_price, presence: true
end
