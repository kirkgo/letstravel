class Ticket < ApplicationRecord
  before_save :set_code, if: :new_record?

  belongs_to :booking

  validates :status, presence: true
  validates :price, presence: true

  enum status: %i[confirmed refunded], _prefix: :status

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
