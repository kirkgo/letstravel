require 'factory_bot_rails'
require 'faker'

p "Creating buses..."
4.times do
  bus = FactoryBot.build(:bus)
  bus.save if bus.valid?
end
