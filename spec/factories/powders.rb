FactoryBot.define do
  factory :powder do
    name { Faker::Name.unique.name }
    user
  end
end
