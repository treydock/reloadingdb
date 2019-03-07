FactoryBot.define do
  factory :caliber do
    name { Faker::Number.number.to_s }
    user
  end
end
