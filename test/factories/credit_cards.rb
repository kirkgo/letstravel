FactoryBot.define do
  factory :credit_card do
    user { nil }
    cardholder { "MyString" }
    number { "MyString" }
    expire_date { "MyString" }
    cvv { "MyString" }
  end
end
