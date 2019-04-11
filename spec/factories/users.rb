# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Name.unique.name.gsub(/\W/, "") }
    password { "foobar" }
    password_confirmation { "foobar" }
    confirmed_at { Date.today }
  end
end
