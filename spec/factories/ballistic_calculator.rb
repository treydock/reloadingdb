FactoryBot.define do
  factory :ballistic_calculator do
    skip_create

    ballistic_coefficient { 0.314 }
    velocity { 2820 }
    range { 200 }
    height_of_sight { 1.5 }
    zero_range { 100 }
  end
end
