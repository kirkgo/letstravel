FactoryBot.define do
  factory :bus do
    bus_code { "#{Faker::Number.number(digits: 8)}" }
    seats { 22 }
    extra_luggage { Faker::Boolean.boolean }
    seat_price { Faker::Commerce.price(range: 12..20.0, as_string: false) }
  end
end
