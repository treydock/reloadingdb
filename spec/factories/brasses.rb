FactoryBot.define do
  factory :brass do
    name { Faker::Name.unique.name }
    user
    caliber
  end
end
