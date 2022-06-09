class City < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true
end
