class Passenger < ApplicationRecord
  belongs_to :user

  has_many :bookings

  validates :user_id, presence: true
  validates :name, presence: true
  validates :id_number, presence: true, uniqueness: true
end
