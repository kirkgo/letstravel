require 'factory_bot_rails'
require 'faker'

p "Creating buses..."
4.times do
  bus = FactoryBot.build(:bus)
  bus.save if bus.valid?
end

p "Creating users..."
User.destroy_all
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

# p "Creating users..."
# 4.times do
#   user = FactoryBot.build(:user)
#   user.save if user.valid?
# end

p "Initializing seeds..."
p "Creating cities..."
10.times do
  city = FactoryBot.build(:city)
  city.save if city.valid?
end
