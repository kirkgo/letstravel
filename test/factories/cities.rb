FactoryBot.define do
  factory :city do
    name { "#{Faker::Address.city}, #{Faker::Address.state_abbr}" }
  end
end
