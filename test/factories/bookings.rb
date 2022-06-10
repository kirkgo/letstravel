FactoryBot.define do
  factory :booking do
    passenger { nil }
    trip { nil }
    status { 1 }
  end
end
