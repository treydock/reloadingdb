FactoryBot.define do
  factory :shooting_velocity do
    date { Date.today }
    velocities { [2000,2001] }
    user
    caliber
    load
  end
end
