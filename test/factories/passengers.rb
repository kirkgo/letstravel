FactoryBot.define do
  factory :passenger do
    user_id { User.all.sample.id }
    name { "#{Faker::Name.name}" }
    id_number { "#{Faker::IDNumber.valid}" }
  end
end
