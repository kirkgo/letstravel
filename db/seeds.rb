require 'factory_bot_rails'
require 'faker'

p "Creating buses..."
4.times do
  bus = FactoryBot.build(:bus)
  bus.save if bus.valid?
end


p "Initializing seeds..."
p "Creating cities..."
10.times do
  city = FactoryBot.build(:city)
  city.save if city.valid?
end

p "Creating trips..."
4.times do
  trip = FactoryBot.build(:trip)
  trip.save if trip.valid?
end

p "Creating users..."
4.times do
  user = FactoryBot.build(:user)
  user.save if user.valid?
end

p "Creating passengers..."
4.times do
  passenger = FactoryBot.build(:passenger)
  passenger.save if passenger.valid?
end

p "Creating users..."
User.create!(
  [
    {
      email: "user01@example.com",
      password: "123456",
      password_confirmation: "123456"
    },
    {
      email: "user02@example.com",
      password: "123456",
      password_confirmation: "123456"
    }
  ]
)

p "Creating passengers..."
Passenger.create!(
  [
    {
      name: "John Doerr",
      id_number: "123-654",
      user_id: 1
    },
    {
      name: "Carl Sagan",
      id_number: "654-321",
      user_id: 2
    }
  ]
)
