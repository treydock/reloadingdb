FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    confirmed_at { Date.today }
  end
end
