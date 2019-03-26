FactoryBot.define do
  factory :gun do
    name { Faker::Name.unique.name.gsub(/\W/, '') }
    sight_height { 1.5 }
    zero_distance { 100 }
    user
    caliber
  end
end
