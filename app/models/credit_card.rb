class CreditCard < ApplicationRecord
  belongs_to :user

  validates :cardholder, presence: true
  validates :number, presence: true
  validates :expire_date, presence: true
  validates :cvv, presence: true
end
