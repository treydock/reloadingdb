FactoryBot.define do
  factory :bullet do
    name { Faker::Name.unique.name }
    grain { "168" }
    caliber
    user
  end
end
