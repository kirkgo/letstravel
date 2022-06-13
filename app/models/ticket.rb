class Ticket < ApplicationRecord
  before_save :set_code, if: :new_record?
  before_save :refund_allowed?, unless: :new_record?

  belongs_to :booking

  validates :status, presence: true
  validates :price, presence: true
  validate :refund_allowed?

  enum status: %i[confirmed refunded], _prefix: :status

  def refund_allowed?
    if DateTime.now > self.booking.trip.departure_date - 30.minutes
      errors.add(:ticket_cannot_be_refunded, "because refund is allowed only 30 minutes before departure time.")
      throw :abort
    end
  end

  def refund
    self.status = 'refunded'
    self.save
  end

  private 

  def set_code
    self.code = generate_code
  end

  def generate_code
    loop do 
      code = SecureRandom.random_number(1000000000000)
      code = "TKT#{code}"

      break code unless Ticket.where(code: code).exists?
    end
  end
end
