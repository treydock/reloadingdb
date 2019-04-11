# frozen_string_literal: true

FactoryBot.define do
  factory :bullet do
    name { Faker::Name.unique.name.gsub(/\W/, "") }
    grain { 168 }
    ballistic_coefficient { 0.01 }
    caliber
    user
  end
end
