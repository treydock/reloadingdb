FactoryBot.define do
  factory :shooting_location do
    name { Faker::Name.unique.name }
    latitude { "9.99" }
    longitude { "9.99" }
    elevation { "9.99" }
    user
  end
end
