# frozen_string_literal: true

FactoryBot.define do
  factory :shooting_log do
    date { Date.today }
    time { Time.now }
    shooting_location
    caliber
    temperature { 1 }
    pressure { 1.5 }
    angle { 1 }
    conditions { "MyText" }
    humidity { 1 }
    wind_speed { 1 }
    wind_direction { 1 }
    notes { "MyText" }
    user
  end
end
