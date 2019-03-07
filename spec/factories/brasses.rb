FactoryBot.define do
  factory :brass do
    name { Faker::Name.unique.name }
    user
    before(:create) do |brass, evaluator|
      brass.caliber = create(:caliber, user: brass.user)
    end
  end
end
