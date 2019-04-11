# frozen_string_literal: true

FactoryBot.define do
  factory :gun do
    name { Faker::Name.unique.name.gsub(/\W/, "") }
    sight_height { 1.5 }
    scope_moa_adjustment { 0.25 }
    zero_distance { 100 }
    user
    caliber
  end
end
