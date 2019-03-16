FactoryBot.define do
  factory :primer do
    name { Faker::Name.unique.name.gsub(/\W/, '') }
    user
  end
end
