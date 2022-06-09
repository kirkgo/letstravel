FactoryBot.define do
  factory :trip do
    bus_id { Bus.all.sample.id }
    departure_id { City.all.sample.id }
    arrival_id { City.all.sample.id }
    departure_date { Faker::Time.between( 
      from: DateTime.now + 1, 
      to: DateTime.now + 4, 
      format: :default) 
    }
  end
end
