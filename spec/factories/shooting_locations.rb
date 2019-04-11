# frozen_string_literal: true

FactoryBot.define do
  factory :shooting_location do
    name { Faker::Name.unique.name.gsub(/\W/, "") }
    latitude { "9.99" }
    longitude { "9.99" }
    elevation { "9.99" }
    user
  end
end
