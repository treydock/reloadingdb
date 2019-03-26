require 'rails_helper'

RSpec.describe Caliber, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:bullets) }
    it { is_expected.to have_many(:brasses) }
    it { is_expected.to have_many(:loads) }
    it { is_expected.to have_many(:guns) }
    it { is_expected.to have_many(:shooting_logs) }
    it { is_expected.to have_many(:shooting_groups) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it do
      skip("PENDING: https://github.com/thoughtbot/shoulda-matchers/issues/814")
      is_expected.to validate_uniqueness_of(:name).scoped_to(:user)
    end
    it 'should have unique name scoped by caliber and user' do
      user1 = create(:user)
      user2 = create(:user)
      create(:caliber, user: user1, name: 'test')
      expect(build(:caliber, user: user2, name: 'test')).to be_valid
      expect(build(:caliber, user: user1, name: 'test')).not_to be_valid
    end
  end
end
