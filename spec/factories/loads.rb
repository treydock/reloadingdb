FactoryBot.define do
  factory :load do
    date { Date.today }
    col { 3.5 }
    speed { 1500 }
    powder_weight { 50 }
    brass_length { 2.8 }
    notes { "FOO\nBAR" }
    caliber
    brass
    bullet
    powder
    primer
    user
    #after(:create) do |load, evaluator|
    #  load.user ||= create(:user)
    #end
  end
end
