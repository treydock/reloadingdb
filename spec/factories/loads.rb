FactoryBot.define do
  factory :load do
    date { Date.today }
    col { "3.5" }
    speed { "1500" }
    powder_weight { "50" }
    brass_length { "2.8" }
    caliber
    brass
    bullet
    powder
    primer
    user
  end
end
