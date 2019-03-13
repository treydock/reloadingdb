require 'rails_helper'

RSpec.describe ShootingLocation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it do
      skip("PENDING: https://github.com/thoughtbot/shoulda-matchers/issues/814")
      is_expected.to validate_uniqueness_of(:name).scoped_to(:user)
    end
    it 'should have unique name scoped by user' do
      user1 = create(:user)
      user2 = create(:user)
      create(:shooting_location, user: user1, name: 'test')
      expect(build(:shooting_location, user: user2, name: 'test')).to be_valid
      expect(build(:shooting_location, user: user1, name: 'test')).not_to be_valid
    end
  end
end
