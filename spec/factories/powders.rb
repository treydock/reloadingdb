FactoryBot.define do
  factory :powder do
    name { Faker::Name.unique.name.gsub(/\W/, '') }
    user
  end
end
