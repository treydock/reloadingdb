# frozen_string_literal: true

FactoryBot.define do
  factory :ballistic_calculator do
    skip_create

    ballistic_coefficient { 0.314 }
    velocity { 2820 }
    height_of_sight { 1.5 }
    zero_range { 100 }
    scope_moa_adjustment { 0.125 }
    wind_speed { 10 }
  end
end
