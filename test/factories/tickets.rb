FactoryBot.define do
  factory :ticket do
    code { "MyString" }
    booking { nil }
    status { 1 }
  end
end
