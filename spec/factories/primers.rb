FactoryBot.define do
  factory :primer do
    name { Faker::Name.unique.name }
    user
  end
end
